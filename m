Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7691C7BC
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 May 2019 13:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfENLWY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 May 2019 07:22:24 -0400
Received: from cpanel4.indieserve.net ([199.212.143.9]:47412 "EHLO
        mayalsocontain.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfENLWY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 May 2019 07:22:24 -0400
X-Greylist: delayed 1161 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 May 2019 07:22:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=em5leMk8J8JQDmqMrhq4CE9Iq0FztZG5dxeYdhTkcew=; b=F6A4XixcpeKdt2Zru93J6WCzqB
        5vd5X/za8iwPVF1Cs3eQEGHOeqH5gWID7LWal8hCMUSq1fAYiQG1mn9ehS82yhdLQm1A0xgKjf7+9
        nXwWG7igkYM7/g0hh4b+Aux3JasU5QjKcETGUD2o7Vpp6/GND9B9/Ykhftxn77Mv1wE8rAmidej5A
        9CxKEoROc0J1ZPH5/1iKAld4CczMImaV08AdjiMIqb4KI8Vok859IqW3MZp1XH98Z2VuBfpBIJ56u
        tXIopqTuZ0wLdGdXdJDA+sQn2e/3WBmMb2zwVVlMLW6AaqTJZGa/d7I8rIwLvJ6KLxXYjuGAN6MEE
        UDqgGfrw==;
Received: from [72.142.126.219] (port=51176 helo=localhost.localdomain)
        by cpanel4.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.91)
        (envelope-from <rpjday@crashcourse.ca>)
        id 1hQVD2-0006hN-N8; Tue, 14 May 2019 07:03:01 -0400
Date:   Tue, 14 May 2019 07:02:54 -0400 (EDT)
From:   "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To:     linux-remoteproc@vger.kernel.org
cc:     ohad@wizery.com, bjorn.andersson@linaro.org
Subject: [PATCH] remoteproc,rpmsg: add missing MAINTAINERS file entries
Message-ID: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel4.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel4.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel4.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a few missing file and directory entries related to both
remoteproc and rpmsg.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/MAINTAINERS b/MAINTAINERS
index fb9f9d71f7a2..fa0958e23b97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13294,9 +13294,11 @@ L:	linux-remoteproc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/remoteproc/
+F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/remoteproc.txt
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/remoteproc/

 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
@@ -13306,8 +13308,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
 S:	Maintained
 F:	drivers/rpmsg/
 F:	Documentation/rpmsg.txt
+F:	Documentation/ABI/testing/sysfs-bus-rpmsg
 F:	include/linux/rpmsg.h
 F:	include/linux/rpmsg/
+F:	include/uapi/linux/rpmsg.h
+F:	samples/rpmsg/

 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
