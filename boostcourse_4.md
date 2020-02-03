## Boostcourse_4

> 사진 관리 앱 만들기

### Photos framework?

: iOS 및 tvOS에서 iCloud 사진 라이브러리를 포합하여 사진 및 비디오에 직접 접근할 수 있다. 이미지 편집또는 iCloud 에셋을 사용하여 작업가능

##### 	에셋 > 에셋 컬렉션(컬렉션) > 컬렉션 리스트

- 객체 가져오기 및 변경요청
  - Photos 프레임워크 모델 클래스 _(PHAsset, PHAssetCollection, PHCollectionList)_의 인스턴스

    : 에셋은 이미지, 비디오, 라이브 포토 / 에셋 컬렉션은 앨범, 특별한 순간 및 사용자가 작업하는 항목 / 컬렉션 리스트는 앨범 폴더, 특별한 순간이다.

- 변경을 관찰

  - 변경 핸들러를 등록하려면 공유 PHPhtoLibrary 객체! 

- Photos 애플리케이션의 기능들을 지원

  - PHCollectionList 클래스를 사용해 특별한 순간 계층에 해당하는 에셋을 찾음, 고프레임 비디오를 식별하려면 PHAsset 클래스 사용

- 에셋과 미리보기 로딩 및 캐싱

  - PHImageManager 클래스를 사용해 지정된 크기로 에셋의 이미지를 요청하거나 비디오 에셋에 사용할 ACFoundation 객체를 요청

- 에셋 콘텐츠 편집

  - PHAsset 및 PHAssetChangeRequest 클래스는 편집을 위해 사진 또는 비디오를 요청하여 편집한 내용을 반영하는 메서드

#### 에셋 검색과 조사

- PHAsset

  > 사진 라이브러리의 이미지, 비디오, 라이브 포토를 나타냅니다.

- PHAssetCollection

  > 특별한 순간, 사용자정의 앨범 또는 스마트 앨범과 같은 사진, 에셋 그룹을 나타냅니다.

- PHCollectionList

  > 특별한 순간, 사용자정의 앨범, 특별한 순간들 연도와 같은 에셋 컬렉션이 포함된 그룹을 나타냅니다.

- PHCollection

  > 에셋 컬렉션 및 컬렉션 리스트의 추상 수퍼 클래스입니다.

- PHObject

  > 모델 객체(에셋 및 컬렉션)의 추상 수퍼 클래스입니다.

- PHFetchResult

  > 가져오기 메서드에서 반환된 에셋 또는 컬렉션의 정렬된 목록입니다.

- PHFetchOptions

  > 에셋 또는 컬렉션 객체를 가져올 때 `Photos`에서 반환하는 결과에 필터링, 정렬 등 영향을 주는 옵션

#### 에셋 콘텐츠 로딩

- PHImageManager

  > 미리보기 썸네일 및 에셋과 전체 크기의 이미지 또는 비디오 데이터를 검색하거나 생성하는 방법을 제공합니다.

- PHCachingImageManager

  > 많은 에셋을 일괄적으로 미리 로딩하기 위해 최적화된 에셋과 관련된 섬네일 및 전체 크기의 이미지 또는 비디오 데이터를 검색하거나 생성하는 방법을 제공합니다.

- PHImageRequestOptions

  > 이미지 매니저로부터 요청한 에셋 이미지의 영향을 주는 옵션들입니다.

- PHVideoRequestOptions

  > 이미지 매니저로부터 요청한 비디오 에셋 데이터의 영향을 주는 옵션들입니다.

- PHLivePhotoRequestOptions

  > 이미지 매니저로부터 요청한 라이브 포토 에셋의 영향을 주는 옵션들입니다.

- PHLivePhoto

  > 캡처 직전과 직후 순간의 움직임 및 소리가 포함된 라이브 사진을 표현합니다.

#### 변경 요청

- PHAssetChangeRequest

  > 사진 라이브러리 변경 블록(클로저)에서 사용하기 위해 에셋의 생성, 삭제, 메타 데이터 수정할 변경 요청 객체입니다.

- PHAssetCollectionChangeRequest

  > 사진 라이브러리 변경 블록(클로저)에서 사용하기 위해 에셋 컬렉션을 생성, 삭제, 수정할 변경 요청 객체입니다.

- PHCollectionListChangeRequest

  > 사진 라이브러리 변경 블록(클로저)에서 사용하기 위해 컬렉션 리스트 생성, 삭제, 수정할 변경 요청 객체입니다.

#### 에셋 콘텐츠 수정

- PHContentEditingInput

  > 편집할 에셋의 이미지, 비디오, 라이브 포토의 콘텐츠에 대한 정보와 접근 권한을 제공하는 컨테이너입니다.

- PHContentEditingOutput

  > 에셋의 사진, 비디오, 라이브 포토의 콘텐츠를 편집한 결과를 제공하는 컨테이너입니다.

- PHAdjustmentData

  > 편집 효과를 재구성하거나 되돌릴 수 있는 에셋의 사진, 비디오, 라이브 포토 콘텐츠의 수정사항에 대한 설명입니다.

#### adjustment Data

- PHContentEditingInputRequestOptions

  > 에셋의 콘텐츠를 수정하도록 요청할 때 이미지, 비디오 데이터전송에 영향을 주는 옵션입니다.

- PHLivePhotoEditingContext

  > 라이브 포토의 사진, 비디오, 오디오 콘텐츠를 수정하기 위한 편집 세션입니다.

- PHLivePhotoFrame

  > 편집 컨텍스트에서 라이브 포토의 단일 프레임에 대한 이미지 콘텐츠를 제공하는 컨테이너입니다.

#### 변경사항 관찰

- PHPhotoLibraryChangeObserver

  > 사진 라이브러리에서 발생한 변경사항을 알리기 위해 구현할 수 있는 프로토콜입니다.

- PHChange

  > 사진 라이브러리에서 발생한 변경사항에 대한 설명입니다.

- PHObjectChangeDetails

  > 에셋 또는 컬렉션 객체에서 발생한 변경사항에 대한 설명입니다.

- PHFetchResultChangeDetails

  > 가져오기 결과에 나열된 에셋 또는 컬렉션 객체에서 발생한 변경사항에 대한 설명입니다.

#### 에셋 리소스로 작업하기

- PHAssetResource

  > 사진 라이브러리의 사진, 비디오, 라이브 포토 에셋과 관련된 기본 데이터 리소스입니다.

- PHAssetCreationRequest

  > 사진 라이브러리 변경 블록(클로저)에서 사용하기 위해 기본 데이터 리소스에서 새로운 에셋을 생성하라는 요청.

- PHAssetResourceCreationOptions

  > 기본 리소스에서 새로운 에셋을 만드는데 영향을 주는 옵션들입니다.

- PHAssetResourceManager

  > 애샛과 관련된 리소스에 대한 기본 데이터 저장소에 접근하는 방법을 제공합니다.

- PHAssetResourceRequestOptions

  > 에셋 리소스 관리자가 요청한 기본 에셋 데이터 전달에 영향을 주는 옵션입니다.