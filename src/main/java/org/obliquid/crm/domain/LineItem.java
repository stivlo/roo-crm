package org.obliquid.crm.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(versionField = "", table = "LINE_ITEM", schema = "roo_crm")
@RooDbManaged(automaticallyDelete = true)
public class LineItem {
}
