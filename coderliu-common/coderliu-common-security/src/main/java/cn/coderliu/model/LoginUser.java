package cn.coderliu.model;

import lombok.Data;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;

import java.util.*;

/**
 * 认证框架需要的用户对象
 */
public class LoginUser extends User implements OAuth2AuthenticatedPrincipal {

    /**
     * 用户ID
     */
    @Getter
    private String id;

    /**
     * 部门ID
     */
    @Getter
    private String deptId;

    /**
     * 手机号
     */
    @Getter
    private String phone;


    @Getter
    private Boolean isAdmin;

    @Getter
    private List<Role> roles;


    public LoginUser(String id, String deptId, String username, String password, String phone, boolean isAdmin, List<Role> roles, boolean enabled,
                     boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked,
                     Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.id = id;
        this.deptId = deptId;
        this.phone = phone;
        this.isAdmin = isAdmin;
        this.roles = roles;
    }

    /**
     * Get the OAuth 2.0 token attributes
     *
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


    @Data
    public static class Role {
        private String id;

        private String name;
        private String dataScope;
    }

}
