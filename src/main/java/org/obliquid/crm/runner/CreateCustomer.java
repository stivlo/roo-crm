package org.obliquid.crm.runner;

import org.obliquid.crm.domain.Customer;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

/**
 * Simple application to create a new customer.
 * 
 * @author stivlo
 * 
 */
@Service
public final class CreateCustomer {

        private void run() {
                Customer customer = new Customer();
                customer.setFirstName("Raffaello");
                customer.setLastName("Baresi");
                customer.persist();
        }

        public static void main(final String[] args) {
                String path = "classpath*:META-INF/spring/applicationContext*.xml";
                ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext(path);
                factory.getBean(CreateCustomer.class).run();
        }

}
