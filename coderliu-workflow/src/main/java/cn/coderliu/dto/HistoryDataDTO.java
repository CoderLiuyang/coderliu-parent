package cn.coderliu.dto;

import lombok.Data;

import java.util.List;

@Data
public class HistoryDataDTO {
    private String taskNodeName;
    private String createName;
    private String createdDate;
    private List<HistoryFormDataDTO> formHistoryDataDTO;


}
