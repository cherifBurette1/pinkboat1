import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  @override
  _Articles createState() => _Articles();
}

class _Articles extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
         PreferredSize(
          
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
             
         
            title: Text(
              "Articles",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[200],
          ),
        ),body:
    SingleChildScrollView(
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Card(
                    elevation: 24,
                    child: ListTile(
                          onTap: () {
                        launch(
                            'https://www.medicalnewstoday.com/articles/37136');
                      },
                      leading: Icon(Icons.album),
                      title: Text('What to know about breast cancer'),
                      subtitle: Text('Elevation - 24'),
                    )),
                     Card(
                    elevation: 24,
                    child: ListTile(
                        onTap: () {
                        launch(
                            'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5715522/');
                      },
                      leading: Icon(Icons.album),
                      title: Text('Risk Factors and Preventions of Breast Cancer'),
                      subtitle: Text('Zhang-Nv Yang'),
                    )),
                Card(
                  elevation: 24,
                  child: ListTile(
                    onTap: () {
                      launch(
                          'https://breast-cancer-research.biomedcentral.com/articles');
                    },
                    leading: Icon(Icons.book),
                    title: Text('Breast Cancer Research'),
                    subtitle: Text('William B. Grant,Article number: 24 '),
                  ),
                ),
                Card(
                    elevation: 24,
                    child: ListTile(
                      onTap: () {
                        launch(
                            'https://breast-cancer-research.biomedcentral.com/articles/10.1186/s13058-020-1253-6');
                      },
                      leading: Icon(Icons.book),
                      title: Text('Breast Cancer Research'),
                      subtitle: Text(' Disorn Sookthai, Theron S. Johnson'),
                    )),
                Card(
                    elevation: 24,
                    child: ListTile(
                      onTap: () {
                        launch(
                            'https://breast-cancer-research.biomedcentral.com/articles/10.1186/s13058-020-01258-x');
                      },
                      leading: Icon(Icons.book),
                      title: Text('Breast Cancer Research'),
                      subtitle: Text(' Albert F. LoBuglio, Richard M. Myers'),
                    )),
               
              

                       Card(
                    elevation: 24,
                    child: ListTile(
                          onTap: () {
                        launch(
                            'https://www.nm.org/healthbeat/healthy-tips/12-articles-about-breast-health-and-breast-cancer');
                      },
                      leading: Icon(Icons.album),
                      title: Text('12 Articles About Breast Health and Breast Cancer'),
                      subtitle: Text('many articles Writer'),
                    )),
               
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}

// class ArticlesDetails extends MaterialPageRoute<Null> {
//   final String id;
//   ArticlesDetails(this.id)
//       : super(builder: (BuildContext) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(id),
//               elevation: 1.0,
//               backgroundColor: Colors.pinkAccent,
//             ),
//             body: Container(
//               child: Text('$id  '),
//             ),
//           );
//         });
// }
