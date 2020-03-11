Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAE85180E96
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Mar 2020 04:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgCKDgW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 23:36:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55453 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727693AbgCKDgW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 23:36:22 -0400
X-UUID: 1aa98038cfbd4693bc62a88c2391dbf7-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DPJUQnv87RbzN8dm0Mgk9azwyYcGOhnHBbgcNu92ga0=;
        b=iERI+jak/HtMasoCvWXvUVw192XtrcERlG2u980a1zpgERP8wFU7foQ3UYStKaKb9IoBEKp51wPndZ01t5tthjGJZhPYwV/6NEBtFSh0vg54X+sRXqkXP66IJgZtStHfuirh/KnKuMIsW7yKirTbIWqZYlzOA2upjLNd0dhkwXU=;
X-UUID: 1aa98038cfbd4693bc62a88c2391dbf7-20200311
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <erin.lo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 763538050; Wed, 11 Mar 2020 11:36:16 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 11:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 11:35:23 +0800
From:   Erin Lo <erin.lo@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <yunfei.dong@mediatek.com>,
        <maoguang.meng@mediatek.com>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <drinkcat@google.com>,
        <shawnku@google.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware 
Date:   Wed, 11 Mar 2020 11:36:01 +0800
Message-ID: <20200311033602.31905-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwMTQ4Y2ZlZmNiZjk4ODk4Y2E2NWJi
MjZkOWQ3ZDYzOGIzMGUyMTFkOg0KDQogIE1lcmdlIGh0dHBzOi8vZ2l0aHViLmNvbS9yamxpYW8t
cWNhL3FjYS1idGZ3ICgyMDIwLTAzLTAyIDA4OjA4OjE1IC0wNTAwKQ0KDQphcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vZXJpbmxv
L2xpbnV4X2Z3X3NjcCB2MTI1NzMuNzcNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGE1MjE1MGQ4ZTFmZTY1OTk0NDY0YjE1ZWExNjJiZGM4OWJhNjFjZTg6DQoNCiAgbWVkaWF0ZWs6
IEFkZCBtdDgxODMgU0NQIGZpcm13YXJlICgyMDIwLTAzLTExIDEwOjM2OjQ1ICswODAwKQ0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQpFcmluIExvICgxKToNCiAgICAgIG1lZGlhdGVrOiBBZGQgbXQ4MTgzIFNDUCBmaXJt
d2FyZQ0KDQogbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcgfCBCaW4gMCAtPiAxMDI3MTA0IGJ5dGVz
DQogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcNCg0K

