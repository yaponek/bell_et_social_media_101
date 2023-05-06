class EnteryData {
  String? id;
  String? detail;
  bool complited;

  EnteryData({
    required this.id,
    required this.detail,
    this.complited = false,
  });

  static List<EnteryData> enteryDataList(){
    return [
      EnteryData(id: '01', detail: 'test this app', complited: true),
      EnteryData(id: '02', detail: 'Start bell GUI',),
      EnteryData(id: '03', detail: 'Simulate Bell UI',),
      EnteryData(id: '04', detail: 'እራት ብላ ', ),
      EnteryData(id: '05', detail: 'ቁርስ ስራ ', complited: true),
      EnteryData(id: '04', detail: 'እራት ብላ ', ),
    ];
  }

}