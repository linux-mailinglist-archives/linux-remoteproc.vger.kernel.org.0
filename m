Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5678058BEA4
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Aug 2022 03:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiHHBMe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 7 Aug 2022 21:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiHHBMd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 7 Aug 2022 21:12:33 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540C7D3;
        Sun,  7 Aug 2022 18:12:32 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M1J6y1QNGz1HBZZ;
        Mon,  8 Aug 2022 09:11:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 09:12:28 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 09:12:28 +0800
Message-ID: <eabc9598-8a82-50a4-e67e-728045ce2280@huawei.com>
Date:   Mon, 8 Aug 2022 09:12:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] remoteproc: rcar_rproc: silince address space sparse
 warning
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Julien Massot <julien.massot@iot.bzh>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-remoteproc@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-kernel@vger.kernel.org>, <rmk+kernel@armlinux.org.uk>,
        "kernel test robot" <lkp@intel.com>
References: <20220808011610.188119-1-wangkefeng.wang@huawei.com>
 <20220808011610.188119-2-wangkefeng.wang@huawei.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220808011610.188119-2-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

ignore this one， send the patch twice.

On 2022/8/8 9:16, Kefeng Wang wrote:
> Fix sparse warnings,
>     drivers/remoteproc/st_remoteproc.c:98:12: sparse: sparse: incorrect type in assignment (different address spaces) @@
> 	   expected void *va @@     got void [noderef] __iomem * @@
>     drivers/remoteproc/st_remoteproc.c:98:12: sparse:     expected void *va
>     drivers/remoteproc/st_remoteproc.c:98:12: sparse:     got void [noderef] __iomem *
>     ...
>     drivers/remoteproc/st_remoteproc.c:114:20: sparse:     expected void volatile [noderef] __iomem *io_addr
>     drivers/remoteproc/st_remoteproc.c:114:20: sparse:     got void *va
>
> Add __iomem to io address space 'va' to fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> note: the commit d803336abdbc "(ARM: mm: kill unused runtime hook arch_iounmap())"
> won't introduce the warning, but lkp report issue to me many times,
> let's fix it.
>
>   drivers/remoteproc/rcar_rproc.c | 2 +-
>   include/linux/remoteproc.h      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index aa86154109c7..e3363a4cde0a 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -22,7 +22,7 @@ static int rcar_rproc_mem_alloc(struct rproc *rproc,
>   				 struct rproc_mem_entry *mem)
>   {
>   	struct device *dev = &rproc->dev;
> -	void *va;
> +	void __iomem *va;
>   
>   	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
>   	va = ioremap_wc(mem->dma, mem->len);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 7c943f0a2fc4..c0c950cf7d72 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -330,7 +330,7 @@ struct rproc;
>    * @alloc: specific memory allocator function
>    */
>   struct rproc_mem_entry {
> -	void *va;
> +	void __iomem *va;
>   	bool is_iomem;
>   	dma_addr_t dma;
>   	size_t len;
