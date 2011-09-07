package org.obliquid.crm.web;

import org.obliquid.crm.domain.Customer;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "customers", formBackingObject = Customer.class)
@RequestMapping("/customers")
@Controller
public class CustomerController {
}
