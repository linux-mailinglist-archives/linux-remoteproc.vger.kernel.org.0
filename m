Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC884C5B78
	for <lists+linux-remoteproc@lfdr.de>; Sun, 27 Feb 2022 14:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiB0Nxb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 27 Feb 2022 08:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiB0Nx3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:53:29 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0E413DF2
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:50 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7EA874092F
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969963;
        bh=beBPqukoSZCIAAv6gBbQLkWehzWMNdiQtzWlJ1M8u3o=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Q0yBogF5EI/STkEA/utUdvdzoZQv3aIdqXs5dw92ptnuSLJ63I4KlAJFeNMiwuVCj
         I3gTmZIvYZOcKsOvq5CV8ldWxrKm0z4zEPLZAvT/X6zIRLHF08lc1Uv3o4b2FqOdkn
         eAlT+RDtY55EiYwHv/sdHdxMt9nPcC7f6adHMJ7TgdSD4ot+jO55arzz/PdnDjxvGf
         3XHaUNAPZ8dijFUoTe8hdIRzAtjELnK3aBPbEfYw3Yn/Akl/QnIRuRZZyIL7dl5Lr9
         XkmMi6vc+J/xqTjbFHlPtigzmR558EadvKilX9Nch4LsiqjB79wZHPa67yqWftbtyA
         Cicp83FpizRPg==
Received: by mail-ed1-f71.google.com with SMTP id y10-20020a056402358a00b00410deddea4cso4231407edc.16
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=beBPqukoSZCIAAv6gBbQLkWehzWMNdiQtzWlJ1M8u3o=;
        b=5MdnRhRKFH8qBCLj2a1Rtst2Qg6ddcyyBKyAZxi+ItYUL/HJW0Wafy/5bcC/AxKlDz
         Zj8BbWAzORCuqxo9aw4YdkLiMdIcvuH5BF+DEjmk6KO/ANZjzAax9Cy0bECXJdqdN78T
         dCLUPtt6HgcebPzrTdtfwpFP7/dzy81Bd72JPTm7sTMvWhZvo0YpZEciDd/r+e5tUY0p
         kz6UHUbBeKARmEKFPzxcC+jmALsiQlbRgGCaei22Ilsuy0bsp9z7yMJ1ay6Jho4K4Zoi
         S5z8Qg0BGtI3W9uS8a7mx0vWwiRFd5pKD3W0h1j/srHrrGX9hPmMBNb88dhjzmpr7fFz
         QPaQ==
X-Gm-Message-State: AOAM530LfG+Vg/L1uee+1unldspT9gV5RNv0F3eQ9PZ8nYf30W3v7kcs
        pSbJCUxDBY/J+VlkYlyg8L78nPa/LARY4zyi9fqdbxq8Cv0JOuGCdxtcQjsIuK65jYC9Kkjc8Ic
        FPvMvUOL4HYn0ZlQRlpDazJA8utueNuTN9biAParvVR2vx1g=
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id h20-20020a05640250d400b004132a276b56mr15602863edb.228.1645969951018;
        Sun, 27 Feb 2022 05:52:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMchrZ/z130i6cHNU0MCCxUHxTeH+44NX7i1itMtaADlHbWFNXu2qsfZhNkboTf+/7DLObYg==
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id h20-20020a05640250d400b004132a276b56mr15602826edb.228.1645969950731;
        Sun, 27 Feb 2022 05:52:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 00/11] Fix broken usage of driver_override (and kfree of static memory)
Date:   Sun, 27 Feb 2022 14:52:03 +0100
Message-Id: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

This is a continuation of my old patchset from 2019. [1]
Back then, few drivers set driver_override wrong. I fixed Exynos
in a different way after discussions. QCOM NGD was not fixed
and a new user appeared - IMX SCU.

It seems "char *" in driver_override looks too consty, so we
tend to make a mistake of storing there string literals.

Changes since latest v2
=======================
1. Make all driver_override fields as "const char *", just like SPI
   and VDPA. (Mark)
2. Move "count" check to the new helper and add "count" argument. (Michael)
3. Fix typos in docs, patch subject. Extend doc. (Michael, Bjorn)
4. Compare pointers to reduce number of string readings in the helper.
5. Fix clk-imx return value.

Changes since latest v1 (not the old 2019 solution):
====================================================
https://lore.kernel.org/all/708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk/
1. Add helper for setting driver_override.
2. Use the helper.

Dependencies (and stable):
==========================
1. All patches, including last three fixes, depend on the first patch
   introducing the helper.
2. The last three commits - fixes - are probably not backportable
   directly, because of this dependency. I don't know how to express
   this dependency here, since stable-kernel-rules.rst mentions only commits as
   possible dependencies.

[1] https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  driver: platform: Add helper for safer setting of driver_override
  amba: Use driver_set_override() instead of open-coding
  fsl-mc: Use driver_set_override() instead of open-coding
  hv: Use driver_set_override() instead of open-coding
  PCI: Use driver_set_override() instead of open-coding
  s390: cio: Use driver_set_override() instead of open-coding
  spi: Use helper for safer setting of driver_override
  vdpa: Use helper for safer setting of driver_override
  clk: imx: scu: Fix kfree() of static memory on setting driver_override
  slimbus: qcom-ngd: Fix kfree() of static memory on setting
    driver_override
  rpmsg: Fix kfree() of static memory on setting driver_override

 drivers/amba/bus.c              | 28 +++---------------
 drivers/base/driver.c           | 51 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 +++---------------
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 +++-------------
 drivers/clk/imx/clk-scu.c       |  7 ++++-
 drivers/hv/vmbus_drv.c          | 28 +++---------------
 drivers/pci/pci-sysfs.c         | 28 +++---------------
 drivers/rpmsg/rpmsg_core.c      |  3 +-
 drivers/rpmsg/rpmsg_internal.h  | 13 +++++++--
 drivers/rpmsg/rpmsg_ns.c        | 14 +++++++--
 drivers/s390/cio/cio.h          |  7 ++++-
 drivers/s390/cio/css.c          | 28 +++---------------
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++-
 drivers/spi/spi.c               | 26 +++--------------
 drivers/vdpa/vdpa.c             | 29 +++----------------
 include/linux/amba/bus.h        |  7 ++++-
 include/linux/device/driver.h   |  2 ++
 include/linux/fsl/mc.h          |  6 ++--
 include/linux/hyperv.h          |  7 ++++-
 include/linux/pci.h             |  7 ++++-
 include/linux/platform_device.h |  7 ++++-
 include/linux/rpmsg.h           |  6 ++--
 include/linux/spi/spi.h         |  2 ++
 include/linux/vdpa.h            |  4 ++-
 24 files changed, 171 insertions(+), 205 deletions(-)

-- 
2.32.0

