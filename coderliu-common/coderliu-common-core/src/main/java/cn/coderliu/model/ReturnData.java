package cn.coderliu.model;

import cn.coderliu.enums.CodeEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReturnData<T> {
    private int code;
    private String message;
    private T data;

    public static <T> ReturnData<T> succeed(String msg) {
        return of(null, CodeEnum.SUCCESS.getCode(), msg);
    }

    public static <T> ReturnData<T> succeed(T model, String msg) {
        return of(model, CodeEnum.SUCCESS.getCode(), msg);
    }

    public static <T> ReturnData<T> succeed(T model) {
        return of(model, CodeEnum.SUCCESS.getCode(), "");
    }

    public static <T> ReturnData<T> of(T datas, Integer code, String msg) {
        return new ReturnData<>(code, msg, datas);
    }

    public static <T> ReturnData<T> failed(String msg) {
        return of(null, CodeEnum.ERROR.getCode(), msg);
    }

    public static <T> ReturnData<T> failed(T model, String msg) {
        return of(model, CodeEnum.ERROR.getCode(), msg);
    }

    public static <T> ReturnData<T> succeed() {
        return of(null, CodeEnum.SUCCESS.getCode(), null);
    }

    public static <T> ReturnData<T> failed() {
        return of(null, CodeEnum.ERROR.getCode(), null);
    }


}
