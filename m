Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96383AC55F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 18 Jun 2021 09:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbhFRH40 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 18 Jun 2021 03:56:26 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:32847 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhFRH4Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Jun 2021 03:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624002848;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=yjHKQ8lMulbXx+wnwSOLruB/LKdAZkXQEDoNCCRjt0o=;
    b=Drh/vG8ejiCnZkjMWjt3ncXd2ZT20/rX0Q4tKNnOcCaEllhEXpDSBkbLGBmtSbclKn
    Bh7cOk2QxiyPiWsVdYbmJF/5cJyVGIKBKZBm8SUVIRpcTG6H/UUl1TL0m6FwQuOHTUvY
    GNoNb+NCVCQY75BzOdjUnlR8GL9TuzkzBfWNan4JN4bWvjWuWsJ+uiigziVXeoTrlUz8
    Tr6io/iRZBaRzDKvutQdA3ua11N42I6gs+b7Z0BUzGula9IO2MvkUaImDH4lBljTuG3a
    62seHldEkW0xRJGmter1RqBtuqm3AxC6PnyH6/BlDvN4tvUDZ0UZk7LmDkYzrRjzVtX6
    LN1A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxA626EOg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.3 DYNA|AUTH)
    with ESMTPSA id 000885x5I7s64DB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 09:54:06 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Leon Romanovsky <leon@kernel.org>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        linuxwwan@intel.com, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH net-next v2 0/3] net: wwan: Add RPMSG WWAN CTRL driver
Date:   Fri, 18 Jun 2021 09:52:40 +0200
Message-Id: <20210618075243.42046-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series adds a WWAN "control" driver for the remote processor
messaging (rpmsg) subsystem. This subsystem allows communicating with
an integrated modem DSP on many Qualcomm SoCs, e.g. MSM8916 or MSM8974.

The driver is a fairly simple glue layer between WWAN and RPMSG
and is mostly based on the existing mhi_wwan_ctrl.c and rpmsg_char.c.

For more information, see commit message in PATCH 2/3.

I already posted a RFC for this a while ago:
https://lore.kernel.org/linux-arm-msm/YLfL9Q+4860uqS8f@gerhold.net/
and now I'm looking for some feedback for the actual changes. :)

Changes in v2: Only in PATCH 3/3
  - Fix EPOLLOUT being always set even if poll op is defined
  - Rename poll() op -> tx_poll() since it should be only used for TX
v1: https://lore.kernel.org/netdev/20210615133229.213064-1-stephan@gerhold.net/

Stephan Gerhold (3):
  rpmsg: core: Add driver_data for rpmsg_device_id
  net: wwan: Add RPMSG WWAN CTRL driver
  net: wwan: Allow WWAN drivers to provide blocking tx and poll function

 MAINTAINERS                           |   7 ++
 drivers/net/wwan/Kconfig              |  18 +++
 drivers/net/wwan/Makefile             |   1 +
 drivers/net/wwan/iosm/iosm_ipc_port.c |   3 +-
 drivers/net/wwan/mhi_wwan_ctrl.c      |   3 +-
 drivers/net/wwan/rpmsg_wwan_ctrl.c    | 156 ++++++++++++++++++++++++++
 drivers/net/wwan/wwan_core.c          |  11 +-
 drivers/net/wwan/wwan_hwsim.c         |   3 +-
 drivers/rpmsg/rpmsg_core.c            |   4 +-
 include/linux/mod_devicetable.h       |   1 +
 include/linux/wwan.h                  |  13 ++-
 11 files changed, 208 insertions(+), 12 deletions(-)
 create mode 100644 drivers/net/wwan/rpmsg_wwan_ctrl.c

-- 
2.32.0

