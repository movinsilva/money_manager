
/*

var touchedIndex = Provider.of<PieTouch>(context, listen: false);


Consumer<PieTouch>(
builder: (context, data, child){
return PieChart(
PieChartData(
sections: getSections(),
sectionsSpace: 5,
pieTouchData: PieTouchData(
touchCallback: (event, pieTouchResponse) {



if (pieTouchResponse!.touchedSection is FlLongPressEnd ||
pieTouchResponse.touchedSection is FlPanEndEvent) {
touchedIndex.setTouchedIndex(-1);
} else {
touchedIndex.setTouchedIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
}
}
)
)
);
},
),

class PieTouch extends ChangeNotifier
{
  int touchedIndex = -1;

  int getTouchedIndex() => touchedIndex;

  setTouchedIndex(int value){
    touchedIndex = value;
    notifyListeners();
  }
}



ChangeNotifierProvider(
          create: (context) {
            PieTouch();
          },
          child: bottomNav(index)),



int k = await DbHelper.instance.insert({
                  'name': 'Movin Silva',
                  'nick_name': 'Movin',
                  'email': 'movinpinsara@gmail.com'
                });

 */