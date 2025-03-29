import Foundation
import AVFoundation
import Vision
import Combine



class PoseEstimator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    let sequenceHandler = VNSequenceRequestHandler()
    
    @Published var bodyParts = [VNHumanBodyPoseObservation.JointName: VNRecognizedPoint]()
    @Published var squatCount = 0
    @Published var pushUpCount = 0
    @Published var isGoodPosture = true
    
    var wasInSquatBottomPosition = false
    var wasInPushUpBottomPosition = false
    
    let levelNumber: Int

    var missingFrames = 0
    var subscriptions = Set<AnyCancellable>()
    
    init(levelNumber: Int) {
        self.levelNumber = levelNumber
        super.init()
        $bodyParts
            .dropFirst()
            .sink { [weak self] bodyParts in
                if self?.levelNumber == 1 || self?.levelNumber == 3 {
                    self?.countPushUps(bodyParts: bodyParts)
                } else {
                    self?.countSquats(bodyParts: bodyParts)
                }
            }
            .store(in: &subscriptions)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let humanBodyRequest = VNDetectHumanBodyPoseRequest(completionHandler: detectedBodyPose)
        do {
            try sequenceHandler.perform([humanBodyRequest],
                                        on: sampleBuffer,
                                        orientation: .right)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func detectedBodyPose(request: VNRequest, error: Error?) {
        guard let bodyPoseResults = request.results as? [VNHumanBodyPoseObservation],
              let bodyParts = try? bodyPoseResults.first?.recognizedPoints(.all) else {
            missingFrames += 1
            if missingFrames > 3 {
                DispatchQueue.main.async {
                    self.isGoodPosture = false
                }
            }
            return
        }
        
        missingFrames = 0
        DispatchQueue.main.async {
            self.bodyParts = bodyParts
        }
    }
    
    func countSquats(bodyParts: [VNHumanBodyPoseObservation.JointName: VNRecognizedPoint]) {
        guard let rightKnee = bodyParts[.rightKnee], rightKnee.confidence > 0.5,
              let leftKnee = bodyParts[.leftKnee], leftKnee.confidence > 0.5,
              let rightHip = bodyParts[.rightHip], rightHip.confidence > 0.5,
              let rightAnkle = bodyParts[.rightAnkle], rightAnkle.confidence > 0.5,
              let leftAnkle = bodyParts[.leftAnkle], leftAnkle.confidence > 0.5
        else {
            isGoodPosture = false
            return
        }
        
        let firstAngle = atan2(rightHip.location.y - rightKnee.location.y, rightHip.location.x - rightKnee.location.x)
        let secondAngle = atan2(rightAnkle.location.y - rightKnee.location.y, rightAnkle.location.x - rightKnee.location.x)
        var angleDiffRadians = firstAngle - secondAngle
        while angleDiffRadians < 0 {
            angleDiffRadians += CGFloat(2 * Double.pi)
        }
        let angleDiffDegrees = Int(angleDiffRadians * 180 / .pi)
                
        if angleDiffDegrees > 150 && wasInSquatBottomPosition {
            squatCount += 1
            wasInSquatBottomPosition = false
        }
        
        let hipHeight = rightHip.location.y
        let kneeHeight = rightKnee.location.y
        
        if hipHeight < kneeHeight  + 0.08 {
            wasInSquatBottomPosition = true
        }
        
        let kneeDistance = rightKnee.location.distance(to: leftKnee.location)
        let ankleDistance = rightAnkle.location.distance(to: leftAnkle.location)
        
        if ankleDistance > kneeDistance {
            self.isGoodPosture = false
        } else {
            self.isGoodPosture = true
        }
    }
    
    func countPushUps(bodyParts: [VNHumanBodyPoseObservation.JointName: VNRecognizedPoint]) {
        guard let rightElbow = bodyParts[.rightElbow], rightElbow.confidence > 0.5,
              let rightShoulder = bodyParts[.rightShoulder], rightShoulder.confidence > 0.5,
              let rightWrist = bodyParts[.rightWrist], rightWrist.confidence > 0.5,
              let nose = bodyParts[.nose], nose.confidence > 0.5  // Detect nose for face position
        else { return }
        
        let faceToWristDistance = nose.location.distance(to: rightWrist.location)
                
                
        let shoulderVector = CGVector(dx: rightShoulder.location.x - rightElbow.location.x,
                                      dy: rightShoulder.location.y - rightElbow.location.y)
        let wristVector = CGVector(dx: rightWrist.location.x - rightElbow.location.x,
                                   dy: rightWrist.location.y - rightElbow.location.y)
        
        let dotProduct = shoulderVector.dx * wristVector.dx + shoulderVector.dy * wristVector.dy
        let magnitude1 = sqrt(shoulderVector.dx * shoulderVector.dx + shoulderVector.dy * shoulderVector.dy)
        let magnitude2 = sqrt(wristVector.dx * wristVector.dx + wristVector.dy * wristVector.dy)
        
        guard magnitude1 > 0, magnitude2 > 0 else { return }
        let angleRadians = acos(dotProduct / (magnitude1 * magnitude2))
        let angleDegrees = angleRadians * 180 / .pi
        
        if faceToWristDistance < 0.168{
            wasInPushUpBottomPosition = true
        }
                
        if angleDegrees > 160 && wasInPushUpBottomPosition {
            squatCount += 1
            wasInPushUpBottomPosition = false
        }
    }

}
