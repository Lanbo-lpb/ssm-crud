package com.lpbcode.service.impl;

import com.lpbcode.dao.DepartmentMapper;
import com.lpbcode.domain.Department;
import com.lpbcode.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> selectAllName() {

        return departmentMapper.selectName();
    }
}
