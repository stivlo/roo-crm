package org.obliquid.crm.runner;

import org.obliquid.crm.domain.Customer;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class UpdateCustomer {

        private void run() {
                Customer aCustomer = Customer.findCustomer(3L);
                //If I use the toString() the lazy initialisation will try to fetch company.
                System.out.println(aCustomer.getCustomerId() + " " + aCustomer.getFirstName() + " "
                                + aCustomer.getLastName());
                aCustomer.setFirstName("Stefano");
                aCustomer.setLastName("Locati");
                aCustomer.merge();
        }

        public static void main(final String[] args) {
                String path = "classpath*:META-INF/spring/applicationContext*.xml";
                final ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext(path);
                factory.getBean(UpdateCustomer.class).run();
        }

}
