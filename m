Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ED1226C88
	for <lists+linux-remoteproc@lfdr.de>; Mon, 20 Jul 2020 18:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgGTQ5r (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Jul 2020 12:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgGTQ5r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Jul 2020 12:57:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CA6C0619D2
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2020 09:57:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so10566423pgf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2020 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HFcC80JUidtRsTSUDISufmr7F4zYUtVwLU2XV8q4Mr0=;
        b=ARdfdFj1NmeTb0sfuOmhKjXFnTj40Hgqe9iDsi1nHPMaauaTgIaiFRIQq6GfVfzo0h
         K78VxGo1OuhMLgPr28z8KrXTJV/17RcTvGpiPl9/JG/S0LB0yQAFjExQSrQySQOz+J+c
         LsW4b9ovw3mP1gyWkayEXN6b1Nbkb/H8mvuZkJatUkCaUMT4rZExWCnF2Wa4hJuwkB29
         V51YQppOAwyQLlXfWCQcpPSjYz+FHK4mCp7nkxuIDM4GLE7RXlj0/VXD0t+9+7/vPN7r
         VCUA+VB3qbhw7GaNst/MrWmPwngCV5Os9eRkYV4tq+CvojifWXDx4hXNW446XHlhVIVi
         eb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HFcC80JUidtRsTSUDISufmr7F4zYUtVwLU2XV8q4Mr0=;
        b=k7ZNiW3WCiYMQWbj0/jfoSWtlXTEsUueyWau0tfRjJu2g7K0CAjj84f6OEILTgrdLo
         iUn2+H15RySplxjfYx91v/dO5PdGspYZX08W0rVB9icaxLWr/IB+TuYRpNMB0b6g/o0z
         LGltgPl5U/NNFI/Qh/ADRdsown1qftIVu7k0g3GXJ3GFoK7Bjskax7gh2hiptiPSW2F2
         weP+vnzXfl8vhRpIFgo0Q4W304sg9sOFVO0Jdnmc0W13jRBng/++r2WcMd8jVc3JDL9X
         rwWeHJTriMqq+T7aYEagpW2odUFAnzhISBklhkPgx+cNppEENN0Lcu08fAvAEKg7PzIp
         ApBA==
X-Gm-Message-State: AOAM532H34yYuQJcO9/V9HC/EwqWzQuKdatZcQuiftAOVz5YRPIZXjo4
        uYdQ9rvOcvusLCYQ3aR7AkGpGdImhf4=
X-Google-Smtp-Source: ABdhPJxpVIgG93k2d+UdAcFHSaqkbUfsjBEpJQtEtIkEA7AoMnK+tFyXD9H9vJZ6+OX8Nr2ZMUKjKA==
X-Received: by 2002:a62:dd91:: with SMTP id w139mr20667241pff.40.1595264266471;
        Mon, 20 Jul 2020 09:57:46 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m17sm17807175pfo.182.2020.07.20.09.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:57:45 -0700 (PDT)
Date:   Mon, 20 Jul 2020 10:57:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v1 2/4] remoteproc: qcom_q6v5_mss: Replace mask based
 tracking with size
Message-ID: <20200720165744.GA1113627@xps15>
References: <1594326716-15474-1-git-send-email-rishabhb@codeaurora.org>
 <1594326716-15474-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594326716-15474-3-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 09, 2020 at 01:31:54PM -0700, Rishabh Bhatnagar wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> In order to land inline coredump support for mss, the dump_segment
> function would need to support granularities less than the segment
> size. This is achieved by replacing mask based tracking with size.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index feb70283b..c6ce032 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -181,8 +181,8 @@ struct q6v5 {
>  	bool running;
>  
>  	bool dump_mba_loaded;
> -	unsigned long dump_segment_mask;
> -	unsigned long dump_complete_mask;
> +	size_t current_dump_size;
> +	size_t total_dump_size;
>  
>  	phys_addr_t mba_phys;
>  	void *mba_region;
> @@ -1203,7 +1203,6 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  {
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
> -	unsigned long mask = BIT((unsigned long)segment->priv);
>  	int offset = segment->da - qproc->mpss_reloc;
>  	void *ptr = NULL;
>  
> @@ -1229,10 +1228,10 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  		memset(dest, 0xff, segment->size);
>  	}
>  
> -	qproc->dump_segment_mask |= mask;
> +	qproc->current_dump_size += segment->size;
>  
>  	/* Reclaim mba after copying segments */
> -	if (qproc->dump_segment_mask == qproc->dump_complete_mask) {
> +	if (qproc->current_dump_size == qproc->total_dump_size) {
>  		if (qproc->dump_mba_loaded) {
>  			/* Try to reset ownership back to Q6 */
>  			q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> @@ -1274,7 +1273,7 @@ static int q6v5_start(struct rproc *rproc)
>  			"Failed to reclaim mba buffer system may become unstable\n");
>  
>  	/* Reset Dump Segment Mask */
> -	qproc->dump_segment_mask = 0;
> +	qproc->current_dump_size = 0;
>  	qproc->running = true;
>  
>  	return 0;
> @@ -1323,7 +1322,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
> -	qproc->dump_complete_mask = 0;
> +	qproc->total_dump_size = 0;
>  
>  	for (i = 0; i < ehdr->e_phnum; i++) {
>  		phdr = &phdrs[i];
> @@ -1338,7 +1337,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  		if (ret)
>  			break;
>  
> -		qproc->dump_complete_mask |= BIT(i);
> +		qproc->total_dump_size += phdr->p_memsz;
>  	}
>  
>  	release_firmware(fw);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
