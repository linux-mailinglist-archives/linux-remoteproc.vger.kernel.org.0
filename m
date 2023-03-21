Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3765B6C2D70
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Mar 2023 10:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjCUJDw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Mar 2023 05:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjCUJDd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Mar 2023 05:03:33 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870DB13DDB;
        Tue, 21 Mar 2023 02:02:32 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L7RnXc018738;
        Tue, 21 Mar 2023 10:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dFP8kD4JWYtTPxrGzcHXUMzOQSup5mN+Ww4ICrRqx64=;
 b=WH0Ic5vCxGGoZGDnW/WZcPwEokNGuYHSiLG+ji76x/GfsxXPQUeHHK87x/Nbcy0YpsS1
 JHa9u6Bi61UEnOV3xj9qKd9QcdO5mw486R1Ki01lSlhTl4Ol+3pF2dLnkQ8AaMXsKG9w
 WQgy+p67IkgTaj6e70VADhpV3tJSO93dzcs8l06TLAPngVUJJ+ky80+e6eIpiDGKs0cR
 WAzIpM+KBC/Ws93xJWDWlDbVZVK9BdUBSq6moeXWMdB+VVb/Jg+UCMlZgi5o7rHpUQvJ
 224YniUQ+8JBKUmEhHaCugMpPlN2fJ/j8QxHkiOAC+Iamt5EP2e/0u/Ys/gUYTr7rL4S Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pf875rpmj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Mar 2023 10:02:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F48410003B;
        Tue, 21 Mar 2023 10:02:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A7552105A0;
        Tue, 21 Mar 2023 10:01:52 +0100 (CET)
Received: from [10.252.5.41] (10.252.5.41) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 21 Mar
 2023 10:01:51 +0100
Message-ID: <2d217351-53db-8978-9fe6-0e02bb4d4897@foss.st.com>
Date:   Tue, 21 Mar 2023 10:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/5] remoteproc: st: Call of_node_put() on iteration error
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <andersson@kernel.org>
CC:     <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <arnaud.pouliquen@st.com>,
        <hongxing.zhu@nxp.com>, <peng.fan@nxp.com>,
        <shengjiu.wang@nxp.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
 <20230320221826.2728078-3-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230320221826.2728078-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.5.41]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_06,2023-03-20_02,2023-02-09_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/20/23 23:18, Mathieu Poirier wrote:
> Function of_phandle_iterator_next() calls of_node_put() on the last
> device_node it iterated over, but when the loop exits prematurely it has
> to be called explicitly.
> 
> Fixes: 3df52ed7f269 ("remoteproc: st: add reserved memory support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/st_remoteproc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a3268d95a50e..e6bd3c7a950a 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -129,6 +129,7 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	while (of_phandle_iterator_next(&it) == 0) {
>  		rmem = of_reserved_mem_lookup(it.node);
>  		if (!rmem) {
> +			of_node_put(it.node);
>  			dev_err(dev, "unable to acquire memory-region\n");
>  			return -EINVAL;
>  		}
> @@ -150,8 +151,10 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  							   it.node->name);
>  		}
>  
> -		if (!mem)
> +		if (!mem) {
> +			of_node_put(it.node);
>  			return -ENOMEM;
> +		}
>  
>  		rproc_add_carveout(rproc, mem);
>  		index++;
