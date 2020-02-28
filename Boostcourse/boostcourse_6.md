### Boostcourse

#### URLSession

HTTP/HTTPS 를 통해 콘텐츠를 주고받는 API를 제공하는 클래스이다. 

1. 용어정리

   - Request : 서버로 요청을 보낼 때 어떤 메서드를 사용할 것인지?
   - Response : URL 요청의 응답을 나타내는 객체

2. 유형

   - 기본 세션(Default Session) : 기본 세션은 URL 다운로드를 위한 다른 파운데이션 메서드와 유사하게 동작한다. __디스크에 저장하는 방식__
   - 임시 세션(Ephemeral Session) : 기본 세션과 유사하지만, 디스크에 어떤 데이터도 저장하지 않고, 메모리에 올려 세션과 연결. __앱 세션을 만료𓂻𓂭키면 세션과 관련한 데이터가 사라짐__
   - 백그라운드 세션(Background Session) : 백그라운드 세션은 별도의 프로세스가 모든 프로세스가 모든 데이터 전송을 처리한다는 점을 제외하고는 기본 세션과 유사함

3. 만들기

   ```swift
   init(configuration: URLSessionConfiguration)
   ```

   ```swift
   class var shared: URLSession{ get }
   ```

4. 세션 구성

   ```swift
   @NSCopying var configurationL URLSessionConfiguration{ get }
   ```

   ```swift
   var delegate: URLSessionDelegate?{ get }
   ```

5. Task

   - URLSessionDataTask - 데이터 작업

     : HTTP의 각종 메서드를 이용해 서버로부터 응답 데이터를 받아서 Data 객체를 가져오는 작업 수행

   - URLSessionUploadTask - 업로드 작업

     : 애플리케이션 웹 서버로 Data 객체 또는 파일 데이터를 업로드하는 작업을 수행. 주로 HTTP의 _post_ 혹은 put 메서드를 이용

   - URLSessionDownloadTask - 다운로드 작업

     : 서버로부터 데이터를 다운로드 받아서 파일의 형태로 저장하는 작업을 수행. 애플리케이션의 상태가 대기 중이거나 실행 중이 아니라면 백그라운드 상태에서도 다운로드 가능

6. Data Task 추가하기

   - dataTask(with:) : URL에 데이터를 요청하는 데이터 작업 객체를 만듬

     ```swift
     func dataTask(with url: URL) -> URLSessionDataTask
     ```

   - dataTask(with:) : URLRequest 객체를 기반으로 URL에 데이터를 요청하는 데이터 작업 객체를 만듬

     ```swift
     func dataTask(with request: URLRequest) -> URLSessionDataTask
     ```

   - dataTask(with: completionHandler:) : URL에 데이터를 요청하고 요청에 대한 응답을 처리할 완료 핸들러를 갖는 데이터 작업 객체를 만듬

     ```swift
     func dataTask(with url: URL, completionHandler: @escaping(Data?, URLResponse?. Error?)->Void)->URLSessionDataTask
     ```

   - dataTask(with: completionHandler:) : URLRequest 객체를 기반으로 URL에 데이터를 요청하고 요청에 대한 응답을 처리할 완료 핸들러를 갖는 데이터 작업 객체를 만듬

     ```swift
     func dataTask(with request: URLRequest, completionHandler: @escaping(Data?, URLResponse?, Error?)->Void)->URLSessionDataTask
     ```

7. Download Task 추가

   - download(with:) : URL에 요청한 데이터를 다운로드 받아서 파일에 저장하는 다운로드 작업을 만듬

     ```swift
     func downloadTask(with url: URL) -> URLSessionDownloadTask	
     ```

   - downloadTask(with: completionHandler: ) ; URL에 요청한 데이터를 다운로드 받아서 파일에 저장한 후 완료 핸들러를 호출

     ```swift
     func downloadTask(with url: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask
     ```

   - downloadTask(with:) : URLRequest 객체를 기반으로 URL에 요청한 데이터를 다운로드 받아 파일로 저장하는 다운로드 작업을 만듬

     ```swift
     func downloadTask(with request: URLRequest) -> URLSessionDownloadTask
     ```

   - downloadTask(with:completionHandler:) : URLRequest 객체를 기반으로 URL에 요청한 데이터를 다운로드 받아서 파일로 저장하고 완료 후 완료 핸들러를 호출하는 다운로드 작업을 만듬

     ```swift
     func downloadTask(with request: URLRequest, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask
     ```

8. Upload Task 추가

   - uploadTask(with: from:) : URLRequest 객체를 기반으로 URL에 데이터를 업로드하는 작업을 만듬

     ```swift
     func uploadTask(with request: URLRequest, from bodyData: Data) -> URLSessionUploadTask
     ```

   - uploadTask(with:from:completionHandler:) : URLRequest 객체를 기반으로 URL에 데이터를 업로드하고 업로드 완료 후 완료 핸들러를 호출하는 작업을 만듬

     ```swift
     func uploadTask(with request: URLRequest, from bodyData: Data?, 
     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask
     ```

   - uploadTask(with:fromFile:) : URLRequest 객체를 기반으로 URL에 파일을 업로드하는 업로드 작업을 만듬

     ```swift
     func uploadTask(with request: URLRequest, fromFile fileURL: URL) -> URLSessionUploadTask
     ```

   - uploadTask(with:fromFile:completionHandler:) : URLRequest 객체를 기반으로 URL에 파일을 업로드하고 업로드 완료 후 완료 핸들러를 호출하는 업로드 작업

     ```swift
     func uploadTask(with request: URLRequest, fromFile fileURL: URL, 
     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask
     ```

9. 작업 상태 제어
   - cancel() - 취소
   - resume() - 일𓂻𓂭중단된 경우 작업을 다𓂻𓂭 시작
   - suspend() - 일𓂻𓂭적으로 중단
   - state() - 작업의 상태 나타내기
   - Priority() - 우선순위

-----

#### ATS

: 애플리케이션과 웹 서비스 사이에 통신 𓂻𓂭 보안 향상을 위한 기능으로 모든 인터넷 통신 𓂻𓂭 안전한 프로토콜을 사용하도록 보장하는 것으로 사용자의 민감한 정보가 유출되는 것을 방지

1. ATS 동작
   - URLSession, CFURL 그리고 NSURLConnection API를 이용해 데이터를 주고받을 때 ATS 기능을 기본적으로 사용
   - ATS 동작 시에는 HTTP 통신을 할 수 없으며 애플에서 권장하는 요구 사항을 충족하지 않은 네트워크는 연결에 실패할 수 있다.
     - 서버는 TLS 프로토콜 버전 1.2 이상을 지원
     - 2048비트 이상의 RSA 키 또는 256비트 이상의 ECC 키가 있는 SHA256을 인증서에 사용
     - 암호 연결은 허용된 암호 목록으로 제한한다

2. 용어 정리

   - 전송 계층 보안

     : 암호 프로토콜이다. 서버와 클라이언트 애플리케이션이 네트워크로 통신하는 과정에서 도청, 간섭, 위조를 방지하기 위해서 설계됨

   - HTTPS 

     : TLS를 사용해 암호화된 연결을 하는 HTTP를 HTTPS라고 함

3. 예외 사항

   - 애플리케이션이 ATS가 요구하는 사항을 충족하기 힘든 경우 비활성화 가능

     - AVFoundation 프레임워크를 통한 스트리밍 서비스
     - Webkit을 통한 콘텐츠 요청
     - 로컬 네트워크 연결
     - etc..

   - ATS 비활성화 방법(info.plist에서 설정)

     - 모든 HTTP 통신 허용

     ```swift
     <key>NSAppTransportSecurity</key>
     <dict>
     	<key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     ```

     - ATS에서 제외할 특정 도메인 지정

     ```swift
      <key>NSAppTransportSecurity</key>
      <dict>
          <key>NSExceptionDomains</key>
          <dict>
              <key>www.abc.com</key>
              <dict>
             <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
                  <true/>
              </dict>
          </dict>
      </dict>
     ```

     