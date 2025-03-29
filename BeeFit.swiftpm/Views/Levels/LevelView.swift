import SwiftUI

struct LevelView: View {
    
    @Binding var level: Level
    @Binding var selectedLevel: Int
    
    let isLast: Bool
    let offset: CGFloat
    
    init(level: Binding<Level>, isLast: Bool, selectedLevel: Binding<Int>) {
        self._level = level
        self.isLast = isLast
        self._selectedLevel = selectedLevel

        let offsets: [CGFloat] = [0, -100, 25, 50, -20]
        offset = offsets[level.wrappedValue.id % offsets.count]
    }
    
    var body: some View {
        VStack {
            ZStack {
                if selectedLevel >= level.id {
                    Circle()
                        .stroke(.gray.opacity(0.3), lineWidth: 7.5)
                    
                    Circle()
                        .trim(from: 0.0, to: level.isDone ? 1.0 : CGFloat(level.doneReps) / CGFloat(level.repsNeeded))
                        .stroke(style: .init(lineWidth: 7.5, lineCap: .round))
                        .rotationEffect(.degrees(270))
                        .foregroundStyle(.indigo)
                }
                
                NavigationLink {
                    ExerciseView(level: $level, selectedLevel: $selectedLevel)
                } label: {
                    Image(systemName: level.id <= selectedLevel ? "star.fill" : "lock.fill")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(level.isDone ? .indigo : level.id > selectedLevel ? .gray : .white)
                }
                .disabled(level.id > selectedLevel || level.isDone)
                .frame(width: 60, height: 60)
                .background(level.id <= selectedLevel || level.id == 0 ? .green : .gray.opacity(0.3))
                .clipShape(Circle())
            }
            .frame(width: 80, height: 80)
            .offset(x: offset)
            .overlay {
                if !isLast {
                    PathView(id: level.id, progress: CGFloat(level.doneReps) / CGFloat(level.repsNeeded), selectedLevel: selectedLevel)
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 150)
    }
}

#Preview {
    HomePageView()
}
