package cn.coderliu.dto;

import lombok.Data;

import java.util.Set;



@Data
public class ActivitiHighLineDTO {
    private Set<String> highPoint;
    private Set<String> highLine;
    private Set<String> waitingToDo;
    private  Set<String>  iDo;

}
