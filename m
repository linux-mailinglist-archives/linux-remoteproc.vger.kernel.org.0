Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC50223A00
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 13:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQLFh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 07:05:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48279 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgGQLFh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:05:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594983936; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=B4HkrjKgk+SXP/IUsCaDUbCyXBVTrzaFa7kJvzg4rDs=;
 b=k2mIAj5keZlUx+Ym0EQWvTGjQ2/HsQvz4u9UqXKa2R8EdC0kFh9C1fag6Gk8pqbVo3mS4UDO
 H+J+cE7jL5owqDhZkdlYpr6QHjEBMRYnbs1n/3XIdY0XLWE6Is2IgSu3eevlNsYBshwd/qdc
 52soLQEFDMEhTuRaUiV8l8col30=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f1185edee6926bb4feed5ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 11:05:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1336DC433C6; Fri, 17 Jul 2020 11:05:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57E48C433C9;
        Fri, 17 Jul 2020 11:05:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Jul 2020 16:35:16 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sibis@codearora.org, tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v8 3/5] remoteproc: Pass size and offset as arguments to
 segment dump function
In-Reply-To: <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
 <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
Message-ID: <93a9dea3f4ee6dcb815530efec8afe92@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-07-17 03:50, Rishabh Bhatnagar wrote:
> Change the segment dump API signature to include size and offset
> arguments. Refactor the qcom_q6v5_mss driver to use these
> arguments while copying the segment. Doing this lays the ground
> work for "inline" coredump functionality being added in the next
> patch.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>


> ---
>  drivers/remoteproc/qcom_q6v5_mss.c       | 10 +++++-----
>  drivers/remoteproc/remoteproc_coredump.c |  5 +++--
>  include/linux/remoteproc.h               |  5 +++--
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> b/drivers/remoteproc/qcom_q6v5_mss.c
> index 037cd45..6baa3ae 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1199,7 +1199,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> 
>  static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  				   struct rproc_dump_segment *segment,
> -				   void *dest)
> +				   void *dest, size_t cp_offset, size_t size)
>  {
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
> @@ -1219,16 +1219,16 @@ static void qcom_q6v5_dump_segment(struct rproc 
> *rproc,
>  	}
> 
>  	if (!ret)
> -		ptr = ioremap_wc(qproc->mpss_phys + offset, segment->size);
> +		ptr = ioremap_wc(qproc->mpss_phys + offset + cp_offset, size);
> 
>  	if (ptr) {
> -		memcpy(dest, ptr, segment->size);
> +		memcpy(dest, ptr, size);
>  		iounmap(ptr);
>  	} else {
> -		memset(dest, 0xff, segment->size);
> +		memset(dest, 0xff, size);
>  	}
> 
> -	qproc->current_dump_size += segment->size;
> +	qproc->current_dump_size += size;
> 
>  	/* Reclaim mba after copying segments */
>  	if (qproc->current_dump_size == qproc->total_dump_size) {
> diff --git a/drivers/remoteproc/remoteproc_coredump.c
> b/drivers/remoteproc/remoteproc_coredump.c
> index ded0244..390f563 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -72,7 +72,8 @@ int rproc_coredump_add_custom_segment(struct rproc 
> *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv)
>  {
>  	struct rproc_dump_segment *segment;
> @@ -183,7 +184,7 @@ void rproc_coredump(struct rproc *rproc)
>  		elf_phdr_set_p_align(class, phdr, 0);
> 
>  		if (segment->dump) {
> -			segment->dump(rproc, segment, data + offset);
> +			segment->dump(rproc, segment, data + offset, 0, segment->size);
>  		} else {
>  			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>  			if (!ptr) {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e7b7bab..eb08139 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -451,7 +451,7 @@ struct rproc_dump_segment {
> 
>  	void *priv;
>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
> -		     void *dest);
> +		     void *dest, size_t offset, size_t size);
>  	loff_t offset;
>  };
> 
> @@ -630,7 +630,8 @@ int rproc_coredump_add_custom_segment(struct rproc 
> *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv);
>  int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 
> machine);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
