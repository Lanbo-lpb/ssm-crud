package com.lpbcode.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lpbcode.domain.Employee;
import com.lpbcode.domain.Msg;
import com.lpbcode.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/empp/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("empp",emp);
    }


    @ResponseBody
    @RequestMapping(value = "/emppp/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        employeeService.updateEmpp(employee);
        return Msg.success();
    }


    @RequestMapping("/emps")
    @ResponseBody//将java对象转为json格式的数据
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);//pn页码，5每页的大小
        List<Employee> employees = employeeService.getAll();//这个就是分页查询了,它紧跟在pagehelper后面
        PageInfo page = new PageInfo(employees,5);//连续传入5页
        return Msg.success().add("pageInfo",page);
    }

    //员工保存
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult result){//@Valid告诉springmvc这个参数需要校验，result是返回值
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<String, Object>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名："+error.getField());
                System.out.println("错误的信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }else {employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    @ResponseBody
    @RequestMapping("/check")
    public Msg checkUser(@RequestParam("empName") String empName){
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名需是2-5位中文或者6-16位英文和数字的组合");
        }
        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    //@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        PageHelper.startPage(pn,5);//pn页码，5每页的大小
//        List<Employee> employees = employeeService.getAll();//这个就是分页查询了,它紧跟在pagehelper后面
//        PageInfo page = new PageInfo(employees,5);//连续传入5页
//        model.addAttribute("pageInfo",page);
//
//        return "list";
//    }
    @RequestMapping("/test")
    public String testTo(){
        return "test";
    }

}
