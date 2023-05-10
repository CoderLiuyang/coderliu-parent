package cn.coderliu.common.utils;

import cn.coderliu.common.constant.TaskConstants;
import cn.coderliu.model.LoginUser;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.util.ObjectUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * 工作流任务工具类
 *
 * @author konbai
 * @createTime 2022/4/24 12:42
 */
public class TaskUtils {

    public static String getUserId() {
        return SecurityUtils.getUser().getId();
    }

    /**
     * 获取用户组信息
     *
     * @return candidateGroup
     */
    public static List<String> getCandidateGroup() {
        List<String> list = new ArrayList<>();
        LoginUser user = SecurityUtils.getUser();
        if (ObjectUtil.isNotNull(user)) {
            if (ObjectUtil.isNotEmpty(user.getRoles())) {
                user.getRoles().forEach(role -> list.add(TaskConstants.ROLE_GROUP_PREFIX + role.getId()));
            }
            if (ObjectUtil.isNotNull(user.getDeptId())) {
                list.add(TaskConstants.DEPT_GROUP_PREFIX + user.getDeptId());
            }
        }
        return list;
    }
}
