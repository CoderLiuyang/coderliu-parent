package cn.coderliu.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginUserRole implements Serializable {
    private String id;

    private String name;
    private String roleKey;

    private String dataScope;
}
