// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.obliquid.crm.web;

import java.lang.String;
import org.obliquid.crm.domain.Customer;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CustomerController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByFirstNameLike", "form" }, method = RequestMethod.GET)
    public String CustomerController.findCustomersByFirstNameLikeForm(Model uiModel) {
        return "customers/findCustomersByFirstNameLike";
    }
    
    @RequestMapping(params = "find=ByFirstNameLike", method = RequestMethod.GET)
    public String CustomerController.findCustomersByFirstNameLike(@RequestParam("firstName") String firstName, Model uiModel) {
        uiModel.addAttribute("customers", Customer.findCustomersByFirstNameLike(firstName).getResultList());
        return "customers/list";
    }
    
}