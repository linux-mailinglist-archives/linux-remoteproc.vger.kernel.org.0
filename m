Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3426160B8E
	for <lists+linux-remoteproc@lfdr.de>; Mon, 17 Feb 2020 08:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgBQH2d (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 17 Feb 2020 02:28:33 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:7113 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725855AbgBQH2c (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Feb 2020 02:28:32 -0500
IronPort-SDR: ZDmpVDGg6xp63SuUvz+2Y9yBkgDm5cw/mwlmoD/R+2izoj+FFFzZv4KEwP76qm9Vfeowi19qxb
 /Wd9yZfeC7OQ==
IronPort-PHdr: =?us-ascii?q?9a23=3ANoJ/VBV9+QZapeBdpYbUHw6CFNbV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbBSHt8tkgFKBZ4jH8fUM07OQ7/m8HzNdqs/Z7jgrS99laV?=
 =?us-ascii?q?wssY0uhQsuAcqIWwXQDcXBSGgEJvlET0Jv5HqhMEJYS47UblzWpWCuv3ZJQk?=
 =?us-ascii?q?2sfQV6Kf7oFYHMks+5y/69+4HJYwVPmTGxfa5+IA+5oAnMucQam4lvJ6Y+xh?=
 =?us-ascii?q?fUvndFevldyH91K16Ugxvz6cC88YJ5/S9Nofwh7clAUav7f6Q8U7NVCSktPn?=
 =?us-ascii?q?426sP2qxTNVBOD6XQAXGoYlBpIGBXF4wrhXpjtqCv6t/Fy1zecMMbrUL07Qz?=
 =?us-ascii?q?Wi76NsSB/1lCcKMiMy/W/LhsBsiq9QvRSsrAF9zYHJeoGYLPRwcKPHfd0ERm?=
 =?us-ascii?q?RPQ8leWDBODI6nc4sCDfYOMfpEo4XhuVcDqwa1Cwm2BOPozz9FnmX40rMm0+?=
 =?us-ascii?q?s/CwHNwQwvH9UIsHTbsd74M78SUeevzKnU1zrOdO5W2TH86IjTbhAhu+uDUq?=
 =?us-ascii?q?9qfsbLyEkvCxrIg1ONooLmJzOYzvoBv3WZ4uZ6SO6ihXIrpxtvrjWg3MshhI?=
 =?us-ascii?q?nEi4QIwV7e7yp52pw6JdigRU5+Zt6rDYVfujmBN4tzXsMiW2ZouDsmyrEeuZ?=
 =?us-ascii?q?60YiwKyJM/yh7acfOHcoyI4gj9W+aVPTt1i2hpeKy4hxmv60egxOr8Vs+q31?=
 =?us-ascii?q?pQsCVFicHAtnEL1xPN9siKUuVx8lqj1DqVygze5P1ILVoqmafUMZIszL49mo?=
 =?us-ascii?q?IWsUvZHy/2nEv2jLWRdkUh4uWo8+PnYq/6ppCGLIJ0lwf+MqU1msyjG+Q3KB?=
 =?us-ascii?q?UBUHKB9eS9yL3v5Vf5T6lSjv0qjqnZt4jXJcAapq6/Hg9U3Z8v6wyhADej19?=
 =?us-ascii?q?QYgWcILEpfeBKAk4fkIE/OIP/mAvelmViskylkx+rAPrL/BpXBNH/DkK3ufe?=
 =?us-ascii?q?U110kJzAs10MAa/Z9RDa0MOOj0UWfvu9HCSBw0KQq5x6DgEtou7I4GXXOzBf?=
 =?us-ascii?q?qhPb/fqxe34eQga72UaZMYoin6Lfcl5P71h3QRlloUfK3v1pwSPiOWBPNjdn?=
 =?us-ascii?q?2UfXf2yugGF2hC6hI5VvDjoECEUCVPfX++VuQ9+mdoW8qdEY7fS9X10/S61y?=
 =?us-ascii?q?ChE8gOaw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G9TQBCQEpelyMYgtllgkOBPgIBgUU?=
 =?us-ascii?q?QUiASjGOGalQGcx+DQ4ZShRaBAIMzhgcTDIFbDQEBAQEBNQIEAQGEQIIEJDw?=
 =?us-ascii?q?CDQIDDQEBBgEBAQEBBQQBAQIQAQEBAQEIFgaFc4I7IoNwIA85SkwBDgGDV4J?=
 =?us-ascii?q?LAQEKKaxzDQ0ChR6COQQKgQiBGyOBNgMBAYwhGnmBB4EjIYIrCAGCAYJ/ARI?=
 =?us-ascii?q?BboJIglkEjVISIYlFmDSBaloElmuCOQEPiBaENwOCWg+BC4MdgwmBZ4RSgX+?=
 =?us-ascii?q?fZoQUV4Egc3EzGggwgW4agSBPGA2ON44rAkCBFxACT4tJgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2G9TQBCQEpelyMYgtllgkOBPgIBgUUQUiASjGOGalQGc?=
 =?us-ascii?q?x+DQ4ZShRaBAIMzhgcTDIFbDQEBAQEBNQIEAQGEQIIEJDwCDQIDDQEBBgEBA?=
 =?us-ascii?q?QEBBQQBAQIQAQEBAQEIFgaFc4I7IoNwIA85SkwBDgGDV4JLAQEKKaxzDQ0Ch?=
 =?us-ascii?q?R6COQQKgQiBGyOBNgMBAYwhGnmBB4EjIYIrCAGCAYJ/ARIBboJIglkEjVISI?=
 =?us-ascii?q?YlFmDSBaloElmuCOQEPiBaENwOCWg+BC4MdgwmBZ4RSgX+fZoQUV4Egc3EzG?=
 =?us-ascii?q?ggwgW4agSBPGA2ON44rAkCBFxACT4tJgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; 
   d="scan'208";a="338054981"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 17 Feb 2020 08:28:20 +0100
Received: (qmail 1821 invoked from network); 17 Feb 2020 06:34:36 -0000
Received: from unknown (HELO 192.168.1.163) (mariapazos@[217.217.179.17])
          (envelope-sender <porta@unistrada.it>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-remoteproc@vger.kernel.org>; 17 Feb 2020 06:34:36 -0000
Date:   Mon, 17 Feb 2020 07:34:36 +0100 (CET)
From:   Peter Wong <porta@unistrada.it>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-remoteproc@vger.kernel.org
Message-ID: <13620384.419897.1581921276692.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

