import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/infrastructure/models/search_reponse.dart';

class SearchReponseMapper {
  static List<SearchResultItem> combineItemstoEntity(
      SearchResponse searchResponse) {
    List<SearchResultItem> searchResultItems = [];
    searchResponse.tracks?.items?.forEach((element) {
      searchResultItems.add(SearchResultItem(
        id: element.id ?? '',
        name: element.name ?? '',
        type: 'track',
        imageUrl: element.album?.images?[0].url ?? '',
      ));
    });
    searchResponse.albums?.items?.forEach((element) {
      searchResultItems.add(SearchResultItem(
        id: element.id ?? '',
        name: element.name ?? '',
        type: 'album',
        imageUrl: element.images?[0].url ?? '',
      ));
    });
    searchResponse.artists?.items?.forEach((element) {
      searchResultItems.add(SearchResultItem(
        id: element.id ?? '',
        name: element.name ?? '',
        type: 'artist',
        imageUrl: (element.images == null) ? '' : element.images?[0].url ?? '',
      ));
    });

    // Sort the search results by name
    searchResultItems.sort((a, b) => a.name.compareTo(b.name));

    return searchResultItems;
  }
}
