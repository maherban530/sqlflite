class District {
  final int stateid;
  final int districtid;
  final String districtname;

  const District({
    this.stateid,
    this.districtid,
    this.districtname,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        stateid: json['stateid'],
        districtid: json['districtid'],
        districtname: json['districtname'],
      );

  Map<String, dynamic> toJson() => {
        'stateid': stateid,
        'districtid': districtid,
        'districtname': districtname,
      };
}

final allDistrict = <District>[
  District(
    stateid: 1,
    districtid: 3,
    districtname: 'Ahmedabad',
  ),
  District(
    stateid: 2,
    districtid: 4,
    districtname: 'Vadodra',
  ),
  District(
    stateid: 2,
    districtid: 5,
    districtname: 'Panchmahal',
  ),
  District(
    stateid: 2,
    districtid: 6,
    districtname: 'Udaipur',
  ),
  District(
    stateid: 2,
    districtid: 7,
    districtname: 'Jaipur',
  ),
  District(
    stateid: 2,
    districtid: 8,
    districtname: 'Jodhpur',
  ),
];
