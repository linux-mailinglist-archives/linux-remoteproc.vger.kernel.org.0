Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B952799ACA
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 Sep 2023 22:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245590AbjIIUSV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 9 Sep 2023 16:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239931AbjIIUSS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 Sep 2023 16:18:18 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BE81717;
        Sat,  9 Sep 2023 13:17:48 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 389KGlYc005599;
        Sat, 9 Sep 2023 20:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=YWNpE/DdUhPfdWUTjyR4ou8zd0vcwrvNu9lOks3R4G8=;
 b=JUWGGoGXhCX0k0p2mnIHZ9z8TvnviMC8VEAW9yaXuprbo1GMq7czqNcUDYn449EGW28F
 U8GO7amto7hNWK2IRM+oWUCQtLwuLFq/bwhhbNp/0COvlMMtjn9jyjE/EfsbJCxjdIXZ
 d/bXK836dl8v6dQMP7F1pyN25wHwRqqBefiELCQT7T57HtLVKmtF0zBUjMXtNYflUyx5
 /PY1zQWJNJU23rmvDUdQ44/jkcxryvyyle8LpqJxa2uf8bpz+q37IxNf+vgWcmq80VmO
 yS0eTQT8+YAEw2BgcNgQ5NySscts07Qy8fgmTjTlCkAPWOhI0XoMe5yJk9rd7B4rm0gt Ow== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0fqjh062-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 09 Sep 2023 20:16:47 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 389KGjYf013563
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 9 Sep 2023 20:16:45 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sat, 9 Sep 2023 13:16:35 -0700
From:   Mukesh Ojha <quic_mojha@quicinc.com>
To:     <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <vigneshr@ti.com>, <nm@ti.com>, <matthias.bgg@gmail.com>,
        <kgene@kernel.org>, <alim.akhtar@samsung.com>,
        <bmasney@redhat.com>, <quic_tsoni@quicinc.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [PATCH v5 00/17] Add Qualcomm Minidump kernel driver related support
Date:   Sun, 10 Sep 2023 01:46:01 +0530
Message-ID: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HQeNjReeU--wNcGWbG5XThgQUQk6HcYR
X-Proofpoint-ORIG-GUID: HQeNjReeU--wNcGWbG5XThgQUQk6HcYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-09_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309090187
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

This is to continuation from the conversation happened at v4

https://lore.kernel.org/lkml/632c5b97-4a91-c3e8-1e6c-33d6c4f6454f@quicinc.com/

https://lore.kernel.org/lkml/695133e6-105f-de2a-5559-555cea0a0462@quicinc.com/

We have put abstract on LPC on this topic as well as initiated a mail thread
with other SoC vendors but did not get much traction on it.

https://lore.kernel.org/lkml/0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com/

We explored most of possiblity present in kernel to address this issue[1] but
solution like kdump/fadump does not seems safe/secure/performant from our
perspective.

Hence, with this series we tried to make the minidump kernel driver, simple
and tied with pstore frontends, so that it collects the present available
frontends data like dmesg, ftrace, pmsg, ftrace., Also, we will be working
towards enhancing generic pstore to capture more debug data which will be
helpful for first hand of debugging that can benefit both other pstore users
as well as us as minidump users.

One of the proposal made here,
https://lore.kernel.org/lkml/1683561060-2197-1-git-send-email-quic_mojha@quicinc.com/

Looking forward for your comments.

Thanks,
Mukesh

[1]
Minidump is a best effort mechanism to collect useful and predefined data
for first level of debugging on end user devices running on Qualcomm SoCs.
It is built on the premise that System on Chip (SoC) or subsystem part of
SoC crashes, due to a range of hardware and software bugs. Hence, the
ability to collect accurate data is only a best-effort. The data collected
could be invalid or corrupted, data collection itself could fail, and so on.

Qualcomm devices in engineering mode provides a mechanism for generating
full system ramdumps for post mortem debugging. But in some cases it's
however not feasible to capture the entire content of RAM. The minidump
mechanism provides the means for selecting which snippets should be
included in the ramdump.

The core of SMEM based minidump feature is part of Qualcomm's boot
firmware code. It initializes shared memory (SMEM), which is a part of
DDR and allocates a small section of SMEM to minidump table i.e also
called global table of content (G-ToC). Each subsystem (APSS, ADSP, ...)
has their own table of segments to be included in the minidump and all
get their reference from G-ToC. Each segment/region has some details
like name, physical address and it's size etc. and it could be anywhere
scattered in the DDR.

Existing upstream Qualcomm remoteproc driver[1] already supports SMEM
based minidump feature for remoteproc instances like ADSP, MODEM, ...
where predefined selective segments of subsystem region can be dumped
as part of coredump collection which generates smaller size artifacts
compared to complete coredump of subsystem on crash.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/remoteproc/qcom_common.c#n142

In addition to managing and querying the APSS minidump description,
the Linux driver maintains a ELF header in a segment. This segment
gets updated with section/program header whenever a new entry gets
registered.

Changes in v5:
 - On suggestion from Pavan.k, to have single function call for minidump collection
   from remoteproc driver, separated the logic to have separate minidump file called
   qcom_rproc_minidump.c and also renamed the function from qcom_minidump() to 
   qcom_rproc_minidump(); however, dropped his suggestion about rework on lazy deletion
   during region unregister in this series, will pursue it in next series.

 - To simplify the minidump driver, removed the complication for frontend and different
   backend from Greg suggestion, will pursue this once main driver gets mainlined.

 - Move the dynamic ramoops region allocation from Device tree approach to command line
   approch with the introduction command line parsing and memblock reservation during
   early boot up; Not added documentation about it yet, will add if it gets positive
   response.

 - Exporting linux banner from kernel to make minidump build also as module, however,
   minidump is a debug module and should be kernel built to get most debug information
   from kernel.

 - Tried to address comments given on dload patch series. 

Changes in v4: https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/
 - Redesigned the driver and divided the driver into front end and backend (smem) so
   that any new backend can be attached easily to avoid code duplication.
 - Patch reordering as per the driver and subsystem to easier review of the code.
 - Removed minidump specific code from remoteproc to minidump smem based driver.
 - Enabled the all the driver as modules.
 - Address comments made on documentation and yaml and Device tree file [Krzysztof/Konrad]
 - Address comments made qcom_pstore_minidump driver and given its Device tree
   same set of properties as ramoops. [Luca/Kees]
 - Added patch for MAINTAINER file.
 - Include defconfig change as one patch as per [Krzysztof] suggestion.
 - Tried to remove the redundant file scope variables from the module as per [Krzysztof] suggestion.
 - Addressed comments made on dload mode patch v6 version
   https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/

Changes in v3: https://lore.kernel.org/lkml/1683133352-10046-1-git-send-email-quic_mojha@quicinc.com/
 - Addressed most of the comments by Srini on v2 and refactored the minidump driver.
    - Added platform device support
    - Unregister region support.
 - Added update region for clients.
 - Added pending region support.
 - Modified the documentation guide accordingly.
 - Added qcom_pstore_ramdump client driver which happen to add ramoops platform
   device and also registers ramoops region with minidump.
 - Added download mode patch series with this minidump series.
    https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/

Changes in v2: https://lore.kernel.org/lkml/1679491817-2498-1-git-send-email-quic_mojha@quicinc.com/
 - Addressed review comment made by [quic_tsoni/bmasney] to add documentation.
 - Addressed comments made by [srinivas.kandagatla]
 - Dropped pstore 6/6 from the last series, till i get conclusion to get pstore
   region in minidump.
 - Fixed issue reported by kernel test robot.

Changes in v1: https://lore.kernel.org/lkml/1676978713-7394-1-git-send-email-quic_mojha@quicinc.com/

Testing of the patches has been done on sm8450 target after enabling config like
CONFIG_PSTORE_RAM and CONFIG_PSTORE_CONSOLE and once the device boots up.

 echo mini > /sys/module/qcom_scm/parameters/download_mode

Try crashing it via devmem2 0xf11c000(this is known to create xpu violation and
and put the device in download mode) on command prompt.

Default storage type is set to via USB, so minidump would be downloaded with the
help of x86_64 machine (running PCAT tool) attached to Qualcomm device which has
backed minidump boot firmware support.

This will make the device go to download mode and collect the minidump on to the
attached x86 machine running the Qualcomm PCAT tool(This comes as part Qualcomm
package manager kit).

After that we will see a bunch of predefined registered region as binary blobs files
starts with md_* downloaded on the x86 machine on given location in PCAT tool from
the target device, more about this can be found in qualcomm minidump guide patch.

Mukesh Ojha (17):
  docs: qcom: Add qualcomm minidump guide
  soc: qcom: Add qcom_rproc_minidump module
  remoteproc: qcom_q6v5_pas: Use qcom_rproc_minidump()
  remoteproc: qcom: Remove minidump related data from qcom_common.c
  init: export linux_banner data variable
  soc: qcom: Add Qualcomm APSS minidump kernel driver
  soc: qcom: minidump: Add pending region registration
  arm64: mm: Add dynamic ramoops region support through command line
  pstore/ram: Use dynamic ramoops reserve resource
  pstore: Add pstore_region_defined() helper and export it
  qcom_minidump: Register ramoops region with minidump
  MAINTAINERS: Add entry for minidump related files
  firmware: qcom_scm: provide a read-modify-write function
  pinctrl: qcom: Use qcom_scm_io_update_field()
  firmware: scm: Modify only the download bits in TCSR register
  firmware: qcom_scm: Refactor code to support multiple download mode
  firmware: qcom_scm: Add multiple download mode support

 Documentation/admin-guide/index.rst         |   1 +
 Documentation/admin-guide/qcom_minidump.rst | 272 +++++++++++
 MAINTAINERS                                 |  10 +
 arch/arm64/mm/init.c                        |  94 ++++
 drivers/firmware/Kconfig                    |  11 -
 drivers/firmware/qcom_scm.c                 |  90 +++-
 drivers/pinctrl/qcom/pinctrl-msm.c          |  10 +-
 drivers/remoteproc/Kconfig                  |   1 +
 drivers/remoteproc/qcom_common.c            | 150 ------
 drivers/remoteproc/qcom_q6v5_pas.c          |   3 +-
 drivers/soc/qcom/Kconfig                    |  24 +
 drivers/soc/qcom/Makefile                   |   3 +
 drivers/soc/qcom/qcom_minidump.c            | 727 ++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_minidump_internal.h   |  74 +++
 drivers/soc/qcom/qcom_ramoops_minidump.c    |  88 ++++
 drivers/soc/qcom/qcom_ramoops_minidump.h    |  10 +
 drivers/soc/qcom/qcom_rproc_minidump.c      | 111 +++++
 drivers/soc/qcom/smem.c                     |  18 +
 fs/pstore/platform.c                        |  15 +
 fs/pstore/ram.c                             |  52 +-
 include/linux/firmware/qcom/qcom_scm.h      |   2 +
 include/linux/init.h                        |   3 +
 include/linux/pstore.h                      |   6 +
 include/linux/pstore_ram.h                  |   2 +
 include/linux/soc/qcom/smem.h               |   2 +
 include/soc/qcom/qcom_minidump.h            |  56 +++
 init/version-timestamp.c                    |   3 +
 27 files changed, 1659 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/admin-guide/qcom_minidump.rst
 create mode 100644 drivers/soc/qcom/qcom_minidump.c
 create mode 100644 drivers/soc/qcom/qcom_minidump_internal.h
 create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.c
 create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.h
 create mode 100644 drivers/soc/qcom/qcom_rproc_minidump.c
 create mode 100644 include/soc/qcom/qcom_minidump.h

-- 
2.7.4

