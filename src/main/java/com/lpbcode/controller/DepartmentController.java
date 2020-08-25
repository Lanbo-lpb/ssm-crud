package com.lpbcode.controller;

import com.lpbcode.domain.Department;
import com.lpbcode.domain.Msg;
import com.lpbcode.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/dept")
    @ResponseBody
    public Msg getDeptWithJson(){
        List<Department> departments = departmentService.selectAllName();
        return Msg.success().add("dName",departments);
    }

}
