import SwiftUI

struct ExerciseView: View {
    @Binding var level: Level
    @Binding var selectedLevel: Int
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user: User
    
    @StateObject private var poseEstimator: PoseEstimator
    
    @State private var isShowingDoneAnimation = false
    
    init(level: Binding<Level>, selectedLevel: Binding<Int>) {
        self._level = level
        self._selectedLevel = selectedLevel
        self._poseEstimator = StateObject(wrappedValue: PoseEstimator(levelNumber: selectedLevel.wrappedValue + 1))
    }
    
    var body: some View {
        ZStack {
            
            if !isShowingDoneAnimation {
                VStack {
                    GeometryReader { geo in
                        CameraViewWrapper(poseEstimator: poseEstimator)
                            .scaleEffect(0.8)
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.75, alignment: .center)
                    HStack {
                        Text("\(selectedLevel == 0 || selectedLevel == 2 ? "Push-ups" : "Squats") counter:")
                            .font(.title)
                        Text(String(poseEstimator.squatCount))
                            .font(.title)
                        Text(" / \(String(level.repsNeeded))")
                            .font(.title)
                    }
                }
                .onAppear {
                    poseEstimator.squatCount = level.doneReps
                }
                .onChange(of: poseEstimator.squatCount) {
                    level.doneReps = poseEstimator.squatCount
                    if selectedLevel == 0 || selectedLevel == 2 {
                        user.donePushUps = poseEstimator.squatCount
                    } else {
                        user.doneSquats = poseEstimator.squatCount
                    }
                    
                    if level.doneReps == level.repsNeeded {
                        isShowingDoneAnimation = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            isShowingDoneAnimation = false
                            selectedLevel += 1
                            dismiss()
                        }
                    }
                }
            } else {
                CompletionView()
            }
            
        }
    }
}
