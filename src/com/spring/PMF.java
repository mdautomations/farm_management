/*
 * Decompiled with CFR 0_110.
 * 
 * Could not load the following classes:
 *  javax.jdo.JDOHelper
 *  javax.jdo.PersistenceManagerFactory
 */
package com.spring;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public class PMF {
    private static final PersistenceManagerFactory pmfInstance = JDOHelper.getPersistenceManagerFactory((String)"transactions-optional");

    private PMF() {
    }

    public static PersistenceManagerFactory get() {
        return pmfInstance;
    }
}