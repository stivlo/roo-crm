// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.obliquid.crm.domain;

import java.lang.String;

privileged aspect CartOrder_Roo_ToString {
    
    public String CartOrder.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CartOrderId: ").append(getCartOrderId()).append(", ");
        sb.append("CustomerId: ").append(getCustomerId()).append(", ");
        sb.append("DateOfOrder: ").append(getDateOfOrder()).append(", ");
        sb.append("LineItems: ").append(getLineItems() == null ? "null" : getLineItems().size());
        return sb.toString();
    }
    
}
