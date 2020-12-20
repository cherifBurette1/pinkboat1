import 'package:flutter/material.dart';

class Photo extends StatefulWidget {
  @override
  _Photo createState() => _Photo();
}

class _Photo extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
         PreferredSize(
          
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
             
         
            title: Text(
              "photo",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[200],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'To be healthier,Follow These Instructions ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.00),
                            ),
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F1.JPG?alt=media&token=7b7ae21b-cf4b-4ee9-ac63-3dd4400e2574'),
                              ),
                            ),
                            Text(
                              'Support Groups',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'No matter how much care you get from friends and family, a support group may also help. Time with other women who are going through the same thing can help you feel less alone. You may talk more about your problems since other group members know what you’re dealing with. You can also ask for advice, like what to expect during different stages of treatment or how to handle side effects.'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F2.JPG?alt=media&token=47031572-0a18-41f7-bffb-2387dc5ed6e0'),
                              ),
                            ),
                            Text(
                              'Supplements to Avoid',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'You may be interested in natural remedies that claim to treat breast cancer and other health problems. But some have plant compounds you should avoid if you’ve had breast cancer. They include red clover, black cohosh, chasteberry, dong quai, evening primrose, and licorice.'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F3.JPG?alt=media&token=96e95cce-32f0-4371-9d66-bf62dfb29549'),
                              ),
                            ),
                            Text(
                              'Phenolic Compounds',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'Studies show these types of chemicals may lower your chances of breast cancer and in some cases slow tumor growth. Add more to your diet in the form of garlic, green tea, soybeans, and flaxseed. Fruits and vegetables that have them include broccoli, cabbage, tomato, eggplant, cucumber, and watermelon.'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F4.JPG?alt=media&token=5d4923bd-1578-4fef-9a22-10b9d8e0c111'),
                              ),
                            ),
                            Text(
                              'Carotenoids',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'This is another type of phytochemical in plant-based food linked to lower breast cancer risk. You can get it from orange, yellow, and dark green vegetables and fruits. Look to include more carrots, pumpkins, winter squash, spinach, kale, sweet potatoes, and cantaloupe in your diet.'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F5.JPG?alt=media&token=a07cc46e-7145-488d-96b8-4d45bf578fa7'),
                              ),
                            ),
                            Text(
                              'Flavonoids',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'These chemicals, which you find in certain plants, are linked to lower breast cancer odds. The evidence is strongest for two specific types, flavonols and flavones, especially for women who are past menopause. You can find flavonols in onions, broccoli, and tea. Flavones come in parsley, celery, and drinks with chamomile.'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F6.JPG?alt=media&token=be0f8741-6de7-4bf2-902c-6eaf5cb282e5'),
                              ),
                            ),
                            Text(
                              'Vitamin D ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'Studies show a link between low levels of this nutrient and higher chances of breast cancer. It may also play a role in the growth of tumors. Add it to your diet with salmon, oysters, herring, mackerel, and sardines. You can also look for milk, yogurt, and orange juice that have it added in'),
                            ),
                          ],
                        )),
                    Card(
                        elevation: 24,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 250,
                              child: Image(
                                fit: BoxFit.contain,
                                height: 200,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fpictures%2F7.JPG?alt=media&token=a6f177bc-fe9b-4374-8e87-b7b76a707d09'),
                              ),
                            ),
                            Text(
                              'Is Alcohol off- limits ?!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  'The link between booze and breast cancer is murky. Beer, wine, and liquor boost estrogen in the body, which raises concerns about tumors that are sensitive to that hormone. Some studies say that survivors who have more than one or two drinks a week are more likely to have cancer come back, while other research says moderate drinking may be good for you. The effects may be fairly small either way, so an occasional glass is not an issue.'),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
