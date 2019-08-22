package com.spring.test.repositories;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.test.entities.Role;

public interface RoleRepository extends JpaRepository<Role, Serializable>
{

}
