package cn.coderliu.model;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * 认证框架需要的用户对象
 */
public class LoginUser extends User implements OAuth2AuthenticatedPrincipal {

    /**
     * 用户ID
     */
    @Getter
    private final String id;

    /**
     * 部门ID
     */
    @Getter
    private final String deptId;

    /**
     * 手机号
     */
    @Getter
    private final String phone;



    public LoginUser(String id, String deptId, String username, String password, String phone, boolean enabled,
                     boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked,
                     Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.id = id;
        this.deptId = deptId;
        this.phone = phone;
    }

    /**
     * Get the OAuth 2.0 token attributes
     * @return the OAuth 2.0 token attributes
     */
    @Override
    public Map<String, Object> getAttributes() {
        return new HashMap<>();
    }

    @Override
    public String getName() {
        return this.getUsername();
    }
}
