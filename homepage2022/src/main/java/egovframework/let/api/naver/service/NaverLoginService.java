package egovframework.let.api.naver.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginService {

	/* 네이버 아이디로 인증 URL 생성 Method */
	String getAuthorizationUrl(HttpSession session, String domain);

	/* 네이버 아이디로 Callback 처리 및 AccessToken 획득 Method */
	OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String domain) throws IOException;

	/* 세션 유효성 검증을 위한 난수 생성기 */
	String generateRandomString();

	/* http session 데이터 저장 */
	void setSession(HttpSession session, String state);

	/* Http session 데이터 가져오기 */
	String getSession(HttpSession session);

	/* Access Token을 이용하여 네이버 사용자 프로필 ApI를 호출 */
	String getUserProfile(OAuth2AccessToken oauthToken) throws IOException;
}
