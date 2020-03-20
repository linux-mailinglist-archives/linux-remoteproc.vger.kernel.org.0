Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3FB18C809
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Mar 2020 08:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgCTHNq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 20 Mar 2020 03:13:46 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29980 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726893AbgCTHNp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Mar 2020 03:13:45 -0400
X-UUID: fe6e58230481426591d35cee78bd5517-20200320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k58APG24uidmU5v8KtptUOGOeNfiLEWeS+xyzZ6fKUI=;
        b=iQ5dSost9Wnho3MFg3aDcFx5NtUWxkTmfe3IuhR1yUa6k0WtBY+nXG7GX5BeU5nqaHFKmoUCyHUvm5qfWIoPRi6Ayw4aRQg2fHtOnaLwGJw78oH138t61PAQw76pjuIrUwPwEJBqWH2T5pm2Qk3uliHu0jroGLlC6n+EcPX4ZDg=;
X-UUID: fe6e58230481426591d35cee78bd5517-20200320
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <erin.lo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 972960322; Fri, 20 Mar 2020 15:13:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:12:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Mar 2020 15:13:37 +0800
From:   Erin Lo <erin.lo@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <yunfei.dong@mediatek.com>,
        <maoguang.meng@mediatek.com>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <erin.lo@mediatek.com>,
        <drinkcat@google.com>, <shawnku@google.com>,
        <srv_heupstream@mediatek.com>
Subject: pull request v2: linux-firmware: Create Mediatek MT8183 SCP firmware  
Date:   Fri, 20 Mar 2020 15:11:42 +0800
Message-ID: <20200320071143.4225-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGksIG1haW50YWluZXJzLA0KQ2hhbmdlcyBzaW5jZSB2MToNCiAtIEFkZCBpbmZvcm1hdGlvbiB0
byBXSEVOQ0UNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwMTQ4Y2ZlZmNi
Zjk4ODk4Y2E2NWJiMjZkOWQ3ZDYzOGIzMGUyMTFkOg0KDQogIE1lcmdlIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yamxpYW8tcWNhL3FjYS1idGZ3ICgyMDIwLTAzLTAyIDA4OjA4OjE1IC0wNTAwKQ0KDQph
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1
Yi5jb20vZXJpbmxvL2xpbnV4X2Z3X3NjcCB2MTI1NzMuNzcNCg0KZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDNjMjEzYWE1OTY2MWM0NjQxZjBjMjE2NmEzMTUxNDBhYzA0NDUyMzA6DQoN
CiAgbWVkaWF0ZWs6IEFkZCBtdDgxODMgU0NQIGZpcm13YXJlICgyMDIwLTAzLTIwIDE0OjM3OjQ5
ICswODAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpFcmluIExvICgxKToNCiAgICAgIG1lZGlhdGVrOiBBZGQgbXQ4
MTgzIFNDUCBmaXJtd2FyZQ0KDQogV0hFTkNFICAgICAgICAgICAgICAgICAgfCAgMTggKysrKysr
KysrKysrKysrKysrDQogbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcgfCBCaW4gMCAtPiAxMDI3MTA0
IGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1lZGlhdGVrL210ODE4My9zY3AuaW1nDQoNCg==

