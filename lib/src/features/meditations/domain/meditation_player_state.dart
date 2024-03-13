class MeditationPlayerState {
  final bool playing;
  final Duration progress;
  final Duration total;

  const MeditationPlayerState({
    this.playing = false,
    this.progress = Duration.zero,
    this.total = Duration.zero,
  });

  MeditationPlayerState copyWith({
    bool? playing,
    Duration? progress,
    Duration? total,
  }) {
    return MeditationPlayerState(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
      total: total ?? this.total,
    );
  }
}