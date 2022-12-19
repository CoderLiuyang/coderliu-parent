package cn.coderliu.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class R<T> {
    private int code;
    private String message;
    private T data;

    public static <T> R<T> succeed(String msg) {
        return of(null, CodeEnum.SUCCESS.getCode(), msg);
    }

    public static <T> R<T> succeed(T model, String msg) {
        return of(model, CodeEnum.SUCCESS.getCode(), msg);
    }

    public static <T> R<T> succeed(T model) {
        return of(model, CodeEnum.SUCCESS.getCode(), "");
    }

    public static <T> R<T> of(T datas, Integer code, String msg) {
        return new R<>(code, msg, datas);
    }

    public static <T> R<T> failed(String msg) {
        return of(null, CodeEnum.ERROR.getCode(), msg);
    }

    public static <T> R<T> timeout(String msg) {
        return of(null, CodeEnum.TIMEOUT.getCode(), msg);
    }


    public static <T> R<T> failed(Integer code, String msg) {
        return of(null, code, msg);
    }

    public static <T> R<T> failed(T model, String msg) {
        return of(model, CodeEnum.ERROR.getCode(), msg);
    }

    public static <T> R<T> succeed() {
        return of(null, CodeEnum.SUCCESS.getCode(), SubmitConstants.SUCCESS);
    }

    public static <T> R<T> failed() {
        return of(null, CodeEnum.ERROR.getCode(), null);
    }


}
