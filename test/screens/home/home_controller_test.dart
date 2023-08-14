import 'dart:convert';

import 'package:styli/apis/repository/api_repository.dart';
import 'package:styli/models/news.dart';
import 'package:styli/screens/home/home_controller.dart';
import 'package:test/test.dart';

const sampleNews =
    '''{"meta":{"found":769054,"returned":10,"limit":10,"page":1},"data":[{"uuid":"3c3b6703-fdf4-4f74-8928-12b41f53540e","title":"Russia’s new history textbooks teach Putin’s alternate reality","description":"New editions of school textbooks promote the Kremlin narrative on Ukraine, blaming the West for the war.","keywords":"","snippet":"Listen 8 min Share Comment RIGA, Latvia — When classes begin next month, Russian high-schoolers will get fresh history textbooks rewritten to carry Kremlin-a...","url":"https://www.washingtonpost.com/world/2023/08/13/russia-history-textbook-revision-ukraine/","image_url":"https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/5TYK5VECKRKSF5QEEEGPZYUW24.jpg&w=1440","language":"en","published_at":"2023-08-13T05:00:00.000000Z","source":"washingtonpost.com","categories":["general","politics"],"relevance_score":null,"locale":"us"},{"uuid":"b703333f-e0da-46a0-abda-9872595f8af2","title":"Alabama riverfront brawl videos spark a cultural moment about race, solidarity and justice","description":"Bystanders who trained their smartphone cameras on an Alabama riverfront dock, as several white boaters pummeled a Black riverboat co-captain, couldn’t have k...","keywords":"Organized crime, Black people, Crime, Violence, U.S. news, General news, Race and ethnicity","snippet":"FILE - A workman removes a restroom sign at Montgomery Municipal Airport, Jan. 5, 1962, in compliance with a federal court order banning segregation. However, c...","url":"https://abcnews.go.com/US/wireStory/alabama-riverfront-brawl-videos-spark-cultural-moment-race-102231233","image_url":"https://s.abcnews.com/images/US/wirestory_b190302a1f347e11868a1a8ddfbd85bc_12x5_992.jpg","language":"en","published_at":"2023-08-13T04:38:43.000000Z","source":"abcnews.go.com","categories":["general","politics"],"relevance_score":null,"locale":"us"},{"uuid":"a7465901-01ce-4c18-a664-27d06313aeb6","title":"As death toll from Maui fire reaches 89, authorities say effort to count the losses is just starting","description":"As the death toll from a wildfire that razed a historic Maui town reached 89, authorities warned Saturday that the effort to find and identify the dead was stil...","keywords":"Natural disasters, Fires, Wildfires, Climate and environment, U.S. news, General news","snippet":"As the death toll from a wildfire that razed a historic Maui town reached 89, authorities warned Saturday that the effort to find and identify the dead was stil...","url":"https://abcnews.go.com/US/wireStory/death-toll-maui-fire-reaches-89-authorities-effort-102231055","image_url":"https://s.abcnews.com/images/US/wirestory_fb2ebf6cd39c149a582b82eed6ac3930_12x5_992.jpg","language":"en","published_at":"2023-08-13T04:38:30.000000Z","source":"abcnews.go.com","categories":["general","politics"],"relevance_score":null,"locale":"us"},{"uuid":"05ec27e0-1b92-4dae-8d12-8cf06f68efd2","title":"Mishmash of how US heat death are counted complicates efforts to keep people safe as Earth warms","description":"Death certificates don’t always reflect the role that extreme heat played in ending a person’s life even when it seems obvious it was a factor","keywords":"Heart attack, Nursing homes, Automotive accidents, Politics, Government programs, COVID-19 pandemic, U.S. news, General news, Health, Climate and environment","snippet":"This undated photo provided by Carla Gates shows Gates and her husband, Dallas mail carrier Eugene Gates Jr. On June 20, 2023, Eugene Gates collapsed on a homeo...","url":"https://abcnews.go.com/US/wireStory/mishmash-us-heat-death-counted-complicates-efforts-people-102230868","image_url":"https://s.abcnews.com/images/US/wirestory_7125ad9a5289625bd9ca312945996399_16x9_992.jpg","language":"en","published_at":"2023-08-13T04:38:28.000000Z","source":"abcnews.go.com","categories":["general","politics"],"relevance_score":null,"locale":"us"},{"uuid":"089956b4-734d-4be4-a25a-2b88421f3caf","title":"Yevgeny Prigozhin: Where in the world is the Wagner warlord?","description":"Late last week, imprisoned Russian opposition leader Alexey Navalny was handed a harsh judgment: After a court hit him with a new 19-year sentence in a penal co...","keywords":"2023 russia paramilitary rebellion, armed forces, belarus, brand safety-nsf sensitive, brand safety-nsf war and military, continents and regions, coups and attempted coups, domestic alerts, domestic-international news, eastern europe, europe, iab-war and conflicts, military, misc organizations, misc people, paramilitary and militia, political figures - intl, russia, russia-ukraine conflict, unrest, conflicts and war, vladimir putin, wagner group, yevgeny prigozhin","snippet":"CNN —Late last week, imprisoned Russian opposition leader Alexey Navalny was handed a harsh judgment: After a court hit him with a new 19-year sentence in a...","url":"https://www.cnn.com/2023/08/13/europe/prigozhin-wagner-warlord-whereabouts-cmd-intl/index.html","image_url":"https://media.cnn.com/api/v1/images/stellar/prod/230629155611-01-week-in-photos-062923.jpg?c=16x9&q=w_800,c_fill","language":"en","published_at":"2023-08-13T04:21:10.000000Z","source":"cnn.com","categories":["general"],"relevance_score":null,"locale":"us"},{"uuid":"f800cda2-8f06-45c8-a35a-53883eefdc40","title":"Skittles blasted over new pro-LGBTQ packaging: ‘Time to Bud Light them’","description":"Skittles' new pro-LGBTQ message has conservatives calling for a boycott of the hugely popular candy -- threatening a repeat of the Bud Light-Dylan Mulvaney back...","keywords":"News, Business, boycotts, bud light, candy, dylan mulvaney, gay rights","snippet":"Taste the wokeness.Skittles is getting pushback from conservatives who have soured on the popular candy’s new “woke” pro-LGBTQ packaging — threatening...","url":"https://nypost.com/2023/08/13/skittles-blasted-over-pro-lgbtq-packaging-time-to-bud-light-them/","image_url":"https://nypost.com/wp-content/uploads/sites/2/2023/08/NYPICHPDPICT000021813854.jpg?quality=75&strip=all&w=1024","language":"en","published_at":"2023-08-13T04:19:02.000000Z","source":"nypost.com","categories":["general"],"relevance_score":null,"locale":"us"},{"uuid":"fae145a8-1c09-4984-b234-644676879694","title":"Shippers warned to stay away from Iranian waters over seizure threat as US-Iran tensions high","description":"Western-backed maritime forces in the Middle East on Saturday warned shippers traveling through the strategic Strait of Hormuz to stay as far away from Iranian ...","keywords":"News, iran, middle east, military, warships","snippet":"Western-backed maritime forces in the Middle East on Saturday warned shippers traveling through the strategic Strait of Hormuz to stay as far away from Iranian ...","url":"https://nypost.com/2023/08/13/shippers-warned-to-stay-away-from-iranian-waters-over-seizure-threat-as-us-iran-tensions-high/","image_url":"https://nypost.com/wp-content/uploads/sites/2/2023/08/newspress-collage-7stk1uyn2-1691898770878.jpg?quality=75&strip=all&1691884428&w=1024","language":"en","published_at":"2023-08-13T04:09:20.000000Z","source":"nypost.com","categories":["general"],"relevance_score":null,"locale":"us"},{"uuid":"af155cdd-a206-49b5-b15d-d61da80dde46","title":"Vicente Luque 'back better than ever,' tops Rafael dos Anjos in UFC main event","description":"Vicente Luque, back for his first fight since suffering a brain hemorrhage in a knockout loss last year, outworked and outwrestled Rafael dos Anjos to score a u...","keywords":"","snippet":"Vicente Luque finishes the fifth and final round of his fight vs. Rafael Dos Anjos in strong fashion. (0:44)Vicente Luque returned to the cage Saturday and pu...","url":"https://www.espn.com/mma/story/_/id/38182213/vicente-luque-back-better-ever-tops-rafael-dos-anjos-ufc-main-event","image_url":"https://a4.espncdn.com/combiner/i?img=/photo/2023/0813/r1209945_2_1296x729_16-9.jpg","language":"en","published_at":"2023-08-13T04:05:44.000000Z","source":"espn.com","categories":["sports","general"],"relevance_score":null,"locale":"us"},{"uuid":"1ee05559-d9a5-4c0f-af5c-0acc2c6c639d","title":"Seattle Mariners fan surprises Félix Hernández at team's Hall of Fame ceremony","description":"Sophia Robinson and Félix Hernández share a special bond since they met through Make-A-Wish in 2013. She surprised him at his Mariners ceremony.","keywords":"","snippet":"Seattle Mariners fan surprises Félix Hernández at team's Hall of Fame ceremonyShow Caption Hide Caption Has MLB commissioner Rob Manfred turned a corner wit...","url":"https://www.usatoday.com/story/sports/mlb/mariners/2023/08/12/mariners-fan-surprises-flix-hernndez-team-hall-of-fame-ceremony/70569621007/","image_url":"https://www.gannett-cdn.com/authoring/authoring-images/2023/08/13/USAT/70583808007-hernandez-robinson.jpg?auto=webp&crop=5753,3247,x0,y1200&format=pjpg&width=1200","language":"en","published_at":"2023-08-13T03:52:16.000000Z","source":"usatoday.com","categories":["general"],"relevance_score":null,"locale":"us"},{"uuid":"fcc648e1-cbfc-4aac-b188-5cda4f627b3e","title":"4 Dead After House Explosion in Pennsylvania, Officials Say","description":"Three homes in the western borough of Plum were destroyed by the huge blast, and about a dozen others were damaged, county officials said.","keywords":"","snippet":"Four people died and three others were injured after a house explosion on a suburban street in Pennsylvania on Saturday spread flames to several nearby homes, s...","url":"https://www.nytimes.com/2023/08/12/us/house-explosion-pennsylvania.html","image_url":"https://static01.nyt.com/images/2023/08/12/multimedia/12Pittsburgh-qwlt/12Pittsburgh-qwlt-facebookJumbo.jpg","language":"en","published_at":"2023-08-13T03:38:27.000000Z","source":"nytimes.com","categories":["general"],"relevance_score":null,"locale":"us"}]}''';

// Sample new object
final news = News(
  uuid: '12345',
  title: 'title',
  description: 'description',
  imageUrl: 'imageUrl',
  publishedAt: DateTime.now(),
);

class ApiRepositoryTestImpl extends ApiRepository {
  ApiRepositoryTestImpl();
  @override
  Future<List<News>> getTopNews(
      {required String token, String locale = 'us', int limit = 100}) async {
    NewsData newsData = NewsData.fromJson(jsonDecode(sampleNews));
    return newsData.data;
  }
}

void main() {
  late HomeController controller;

  setUpAll(
    () {},
  );

  group(
    'HomeController initialization',
    () {
      test(
        'News items should be empty at initialization',
        () {
          controller = HomeController(ApiRepositoryTestImpl());
          expect(controller.news.isEmpty, true);
        },
      );
    },
  );

  group(
    'HomeController api calling',
    () {
      test(
        'calling top news from NewsAPI',
        () async {
          controller = HomeController(ApiRepositoryTestImpl());
          await controller.getTopNews();
          expect(controller.news.isNotEmpty, true);
        },
      );
      test(
        'Add one news object to list and verify getting same object at first place',
        () async {
          controller = HomeController(ApiRepositoryTestImpl());

          controller.news.addAll([news]);
          expect(controller.news.isNotEmpty, true);
          expect(controller.news[0], news);
        },
      );
      test(
        'Add multiple news object to list and verify items are added',
        () async {
          controller = HomeController(ApiRepositoryTestImpl());
          NewsData newsData = NewsData.fromJson(jsonDecode(sampleNews));
          controller.news.addAll(newsData.data);
          expect(controller.news.isNotEmpty, true);
          expect(controller.news.length, newsData.data.length);
        },
      );
    },
  );
}
