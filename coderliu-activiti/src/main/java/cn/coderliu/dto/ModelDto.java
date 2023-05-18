package cn.coderliu.dto;


import lombok.Data;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 模型dto
 */
@Data
public class ModelDto {

    private String id;
    private String name;
    private String key;
    private String description;
}
