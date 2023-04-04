Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F4A6D676D
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Apr 2023 17:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbjDDPeL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Apr 2023 11:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbjDDPeJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Apr 2023 11:34:09 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E5A211D;
        Tue,  4 Apr 2023 08:34:08 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334DItm1004091;
        Tue, 4 Apr 2023 17:33:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DqoMUOl84qAxYmLCh80KNtJg5Ir0IEjSOZQgQ2rfR+U=;
 b=bRdm1ozxGy4JGpSVk7F+O5uEnVZiZ+VDq12thED6jcLIjSA3AjMlfGEJISx273k6Om2q
 dXIhG33FLPCjTWp4o2OYsmnT6dlDXvZ+Bcltp3E9IT6H4uQ+jz0fgZqdCqkUQGjVBBj7
 lQnSs3lZHAzkAgn5Sm88+QhE7EptAhuvLvMsr9ZKUzJECkH+tv2aOOuuXQvj9EpNxlQf
 IZoAmr3yBawR//Gn50P34rPcPge+vkF0esZGdFm/ZXW2Ru9UV4zLjZ6nMqogKZrXbZ4Q
 jO3fEOXwh5DNv4G/i46osQQz7JiWXi2V/hd2GV+g0z9+dr4CIH7ySEw+jd0h1KUzS9KV Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3prmny0sjm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 17:33:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D089710002A;
        Tue,  4 Apr 2023 17:33:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C51152248CF;
        Tue,  4 Apr 2023 17:33:55 +0200 (CEST)
Received: from [10.252.11.89] (10.252.11.89) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 4 Apr
 2023 17:33:52 +0200
Message-ID: <14e897f3-1d11-f4d2-ad04-d328e7a57564@foss.st.com>
Date:   Tue, 4 Apr 2023 17:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] ARM: dts: stm32: Remove the st,syscfg-tz property
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
 <20230331154651.3107173-3-arnaud.pouliquen@foss.st.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230331154651.3107173-3-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.11.89]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_07,2023-04-04_04,2023-02-09_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/31/23 17:46, Arnaud Pouliquen wrote:
> Since the introduction of the SCMI server for the management
> of the MCU hold boot in OPTEE, management of the hold boot by smc call
> is deprecated.
> Clean the st,syscfg-tz  which allows to determine if the trust
> zone is enable.


Please don't waste time to review the commit message above!

The subject and the commit message is not aligned with the commit update

I need to rework it in a V2. I'm waiting few days before sending the V2,
allowing people to comment V1.

For V2 I will probably copy/past the commit message of:

[PATCH 1/5] dt-bindings: remoteproc: st,stm32-rproc: Rework reset declarations

Regards,
Arnaud

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 4e437d3f2ed6..25626797db94 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1820,8 +1820,8 @@ m4_rproc: m4@10000000 {
>  			      <0x30000000 0x40000>,
>  			      <0x38000000 0x10000>;
>  			resets = <&rcc MCU_R>;
> +			reset-names = "mcu_rst";
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> -			st,syscfg-tz = <&rcc 0x000 0x1>;
>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
>  			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>  			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;

