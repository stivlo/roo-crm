package org.obliquid.crm.runner;

import org.obliquid.crm.domain.Customer;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class CountCustomers {

        private void run() {
                System.out.println("Customer count: " + Customer.countCustomers());
        }

        public static void main(final String[] args) {
                String path = "classpath*:META-INF/spring/applicationContext*.xml";
                final ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext(path);
                factory.getBean(CountCustomers.class).run();
        }

}
