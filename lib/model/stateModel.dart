class AnimationItems {
  final int stateid;
  final String statename;

  const AnimationItems({
    this.stateid,
    this.statename,
  });

  factory AnimationItems.fromJson(Map<String, dynamic> json) => AnimationItems(
        stateid: json['stateid'],
        statename: json['statename'],
      );

  Map<String, dynamic> toJson() => {
        'stateid': stateid,
        'statename': statename,
      };
}

final allAnimationItems = <AnimationItems>[
  AnimationItems(
    stateid: 1,
    statename: 'Gujarat',
  ),
  AnimationItems(
    stateid: 2,
    statename: 'Rajasthan',
  ),
];
