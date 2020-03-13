### UISearchController

추가

```swift
let searchController = UISearchController(searchResultsController: nil)
```

searchBar에 응답하려고하려면 <code>UISearchResultsUpdating</code>을 구현해야함

```swift
// Setup the Search Controller
searchController.searchResultsUpdater = self
searchController.obscuresBackgroundDuringPresentation = false
searchController.searchBar.placeholder = "Search Candies"
navigationItem.searchController = searchController
definesPresentationContext = true
```

이 코드에서 나타내는 것들

1. <code>searchResultsUpdater</code> 은 UISearchController기반의 새로운 속성이다.
2. <code>obscuresBackgroundDuringPresentation</code> 은 흐리게 만든다.
3. <code>placeholder</code> 를 이 앱의 특정항목으로
4. 네비게이션 아이템으로 searchBar를 추가
5. UISearchController가 활성화되어있는 동안 사용자가 다른 뷰 컨트롤러로 이동하면 searchBar가 화면에 남아있지 않도록 한다.



