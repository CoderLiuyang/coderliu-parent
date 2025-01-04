

package cn.coderliu.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Optional;

/**
 * Miscellaneous utilities for web applications.
 *
 * @author L.cm
 */
@Slf4j
@UtilityClass
public class SecurityWebUtils extends org.springframework.web.util.WebUtils {

    private final String BASIC_ = "Basic ";

    private final String UNKNOWN = "unknown";


    /**
     * 读取cookie
     *
     * @param name cookie name
     * @return cookie value
     */
    public String getCookieVal(String name) {
        if (SecurityWebUtils.getRequest().isPresent()) {
            return getCookieVal(SecurityWebUtils.getRequest().get(), name);
        }
        return null;
    }

    /**
     * 读取cookie
     *
     * @param request HttpServletRequest
     * @param name    cookie name
     * @return cookie value
     */
    public String getCookieVal(HttpServletRequest request, String name) {
        Cookie cookie = getCookie(request, name);
        return cookie != null ? cookie.getValue() : null;
    }

    /**
     * 清除 某个指定的cookie
     *
     * @param response HttpServletResponse
     * @param key      cookie key
     */
    public void removeCookie(HttpServletResponse response, String key) {
        setCookie(response, key, null, 0);
    }

    /**
     * 设置cookie
     *
     * @param response        HttpServletResponse
     * @param name            cookie name
     * @param value           cookie value
     * @param maxAgeInSeconds maxage
     */
    public void setCookie(HttpServletResponse response, String name, String value, int maxAgeInSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        cookie.setMaxAge(maxAgeInSeconds);
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }

    /**
     * 获取 HttpServletRequest
     *
     * @return {HttpServletRequest}
     */
    public Optional<HttpServletRequest> getRequest() {
        return Optional
                .ofNullable(((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
    }

    /**
     * 获取 HttpServletResponse
     *
     * @return {HttpServletResponse}
     */
    public HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

//    /**
//     * 从request 获取CLIENT_ID
//     *
//     * @return
//     */
//    @SneakyThrows
//    public String getClientId(ServerHttpRequest request) {
//        String header = request.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
//        return splitClient(header)[0];
//    }
//
//    @SneakyThrows
//    public String getClientId() {
//        if (SecurityWebUtils.getRequest().isPresent()) {
//            String header = SecurityWebUtils.getRequest().get().getHeader(HttpHeaders.AUTHORIZATION);
//            return splitClient(header)[0];
//        }
//        return null;
//    }
//
//    private static String[] splitClient(String header) {
//        if (header == null || !header.startsWith(BASIC_)) {
//            throw new CheckedException("请求头中client信息为空");
//        }
//        byte[] base64Token = header.substring(6).getBytes(StandardCharsets.UTF_8);
//        byte[] decoded;
//        try {
//            decoded = Base64.decode(base64Token);
//        } catch (IllegalArgumentException e) {
//            throw new CheckedException("Failed to decode basic authentication token");
//        }
//
//        String token = new String(decoded, StandardCharsets.UTF_8);
//
//        int delim = token.indexOf(":");
//
//        if (delim == -1) {
//            throw new CheckedException("Invalid basic authentication token");
//        }
//        return new String[]{token.substring(0, delim), token.substring(delim + 1)};
//    }

}
