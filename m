Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF15B6DF1F3
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Apr 2023 12:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjDLKag (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Apr 2023 06:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjDLKa3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Apr 2023 06:30:29 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118776E80;
        Wed, 12 Apr 2023 03:30:25 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CAUFws046650;
        Wed, 12 Apr 2023 05:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1681295415;
        bh=0FzCz5eeJRH2yU9foXR8AIy2YrmkIhw88/pWp8ZrEDI=;
        h=From:To:CC:Subject:Date;
        b=nFRjoRiXkWRL1ujv2zYSW6eCJCNFujrW/ipxJw2otZ5dd+XXKjgOBx0ahesbK9+qb
         LiCCWuAMOFrSIPkslnF5/T4nSkTHc7jm6M3lyKvc4bGFqfaJXg9REC0ojcmssPabYE
         Ut9tze+oLxuSr0dwgqiotOhbgJhxXKMgdwTo4T9w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CAUF5Q008413
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Apr 2023 05:30:15 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 05:30:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 05:30:15 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CAUEgs089881;
        Wed, 12 Apr 2023 05:30:14 -0500
Received: from localhost (uda0501179.dhcp.ti.com [10.24.69.114])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 33CAUDJv028919;
        Wed, 12 Apr 2023 05:30:14 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <srk@ti.com>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: [PATCH v8 0/4] Introduce PRU platform consumer API
Date:   Wed, 12 Apr 2023 16:00:08 +0530
Message-ID: <20230412103012.1754161-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,
The Programmable Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS
or simply PRUSS) on various TI SoCs consists of dual 32-bit RISC cores
(Programmable Real-Time Units, or PRUs) for program execution.

There are 3 foundation components for TI PRUSS subsystem: the PRUSS platform
driver, the PRUSS INTC driver and the PRUSS remoteproc driver. All of them have
already been merged and can be found under:
1) drivers/soc/ti/pruss.c
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
2) drivers/irqchip/irq-pruss-intc.c
   Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
3) drivers/remoteproc/pru_rproc.c
   Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml

The programmable nature of the PRUs provide flexibility to implement custom
peripheral interfaces, fast real-time responses, or specialized data handling.
Example of a PRU consumer drivers will be: 
  - Software UART over PRUSS
  - PRU-ICSS Ethernet EMAC

In order to make usage of common PRU resources and allow the consumer drivers 
to configure the PRU hardware for specific usage the PRU API is introduced.

This is the v8 of the old patch series [10].

Changes from v7 [10] to v8:
*) Addressed Mathieu's comments and moved pruss related API definitions to
linux/pruss_driver.h
*) Moved enum pruss_mem, pruss_gp_mux_sel, pruss_gpi_mode, pru_type and struct
pruss_mem_region from remoteproc/pruss.h to linux/pruss_driver.h as asked by
Mathieu.

Changes from v6 [9] to v7:
*) Addressed Simon's comment on patch 3 of this series and dropped unnecassary
macros from the patch.

Changes from v5 [1] to v6:
*) Added Reviewed by tags of Roger and Tony to the patches.
*) Added Acked by tag of Mathieu to patch 2 of this series.
*) Added NULL check for @mux in pruss_cfg_get_gpmux() API.
*) Added comment to the pruss_get() function documentation mentioning it is
expected the caller will have done a pru_rproc_get() on @rproc.
*) Fixed compilation warning "warning: ‘pruss_cfg_update’ defined but not used"
in patch 3 by squashing patch 3 [7] and patch 5 [8] of previous revision
together. Squashed patch 5 instead of patch 4 with patch 3 because patch 5 uses
both read() and update() APIs where as patch 4 only uses update() API.
Previously pruss_cfg_read()/update() APIs were intoroduced in patch 3
and used in patch 4 and 5. Now these APIs are introduced as well as used in 
patch 3.

Changes from v4 [2] to v5:
*) Addressed Roger's comment to change function argument in API 
pruss_cfg_xfr_enable(). Instead of asking user to calcualte mask, now user
will just provide the pru_type and mask will be calcualted inside the API.
*) Moved enum pru_type from pru_rproc.c to include/linux/remoteproc/pruss.h
in patch 4 / 5.
*) Moved enum pruss_gpi_mode from patch 3/5 to patch 4/5 to introduce this
enum in same patch as the API using it.
*) Moved enum pruss_gp_mux_sel from patch 3/5 to patch 5/5 to introduce this
enum in same patch as the API using it.
*) Created new headefile drivers/soc/ti/pruss.h, private to PRUSS as asked by
Roger. Moved all private definitions and pruss_cfg_read () / update ()
APIs to this newly added headerfile.
*) Renamed include/linux/pruss_driver.h to include/linux/pruss_internal.h as
suggested by Andrew and Roger.

Changes from v3 [3] to v4:
*) Added my SoB tags in all patches as earlier SoB tags were missing in few
patches.
*) Added Roger's RB tags in 3 patches.
*) Addressed Roger's comment in patch 4/5 of this series. Added check for 
   invalid GPI mode in pruss_cfg_gpimode() API.
*) Removed patch [4] from this series as that patch is no longer required.
*) Made pruss_cfg_read() and pruss_cfg_update() APIs internal to pruss.c by
   removing EXPORT_SYMBOL_GPL and making them static. Now these APIs are 
   internal to pruss.c and PRUSS CFG space is not exposed.
*) Moved APIs pruss_cfg_gpimode(), pruss_cfg_miirt_enable(), 
   pruss_cfg_xfr_enable(), pruss_cfg_get_gpmux(), pruss_cfg_set_gpmux() to
   pruss.c file as they are using APIs pruss_cfg_read / update. 
   Defined these APIs in pruss.h file as other drivers use these APIs to 
   perform respective operations.

Changes from v2 to v3:
*) No functional changes, the old series has been rebased on linux-next (tag:
next-20230306).

This series depends on another series which is already merged in the remoteproc
tree [5] and is part of v6.3-rc1. This series and the remoteproc series form 
the PRUSS consumer API which can be used by consumer drivers to utilize the 
PRUs.

One example of the consumer driver is the PRU-ICSSG ethernet driver [6],which 
depends on this series and the remoteproc series [5].

[1] https://lore.kernel.org/all/20230323062451.2925996-1-danishanwar@ti.com/
[2] https://lore.kernel.org/all/20230313111127.1229187-1-danishanwar@ti.com/
[3] https://lore.kernel.org/all/20230306110934.2736465-1-danishanwar@ti.com/
[4] https://lore.kernel.org/all/20230306110934.2736465-6-danishanwar@ti.com/
[5] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/#t
[6] https://lore.kernel.org/all/20230210114957.2667963-1-danishanwar@ti.com/
[7] https://lore.kernel.org/all/20230323062451.2925996-4-danishanwar@ti.com/
[8] https://lore.kernel.org/all/20230323062451.2925996-6-danishanwar@ti.com/
[9] https://lore.kernel.org/all/20230331112941.823410-1-danishanwar@ti.com/
[10] https://lore.kernel.org/all/20230404115336.599430-1-danishanwar@ti.com/

Thanks and Regards,
Md Danish Anwar

Andrew F. Davis (1):
  soc: ti: pruss: Add pruss_{request,release}_mem_region() API

Suman Anna (2):
  soc: ti: pruss: Add pruss_cfg_read()/update(),
    pruss_cfg_get_gpmux()/set_gpmux() APIs
  soc: ti: pruss: Add helper functions to set GPI mode, MII_RT_event and
    XFR

Tero Kristo (1):
  soc: ti: pruss: Add pruss_get()/put() API

 drivers/remoteproc/pru_rproc.c |  15 --
 drivers/soc/ti/pruss.c         | 258 +++++++++++++++++++++++++++++++++
 drivers/soc/ti/pruss.h         |  88 +++++++++++
 include/linux/pruss_driver.h   | 123 ++++++++++++++++
 4 files changed, 469 insertions(+), 15 deletions(-)
 create mode 100644 drivers/soc/ti/pruss.h

-- 
2.34.1

