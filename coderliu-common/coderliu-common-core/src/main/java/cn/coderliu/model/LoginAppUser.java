package cn.coderliu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.social.security.SocialUserDetails;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @ClassName: LoginAppUser
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:38 下午
 * @Version: V1.0
 **/
@Getter
@Setter
public class LoginAppUser extends SysUser implements SocialUserDetails {
    private static final long serialVersionUID = -3685249101751401211L;

    private Set<String> permissions;

    /***
     * 权限重写
     */
    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collection = new HashSet<>();
//        if (!CollectionUtils.isEmpty(super.getRoles())) {
//            super.getRoles().parallelStream().forEach(role -> collection.add(new SimpleGrantedAuthority(role.getCode())));
//        }
        return collection;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return super.getEnabled();
    }

    @Override
    public String getUserId() {
        return getUserId();
    }
}
