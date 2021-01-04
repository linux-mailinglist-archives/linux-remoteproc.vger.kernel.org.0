Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65B2E9F18
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 Jan 2021 21:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhADU50 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 4 Jan 2021 15:57:26 -0500
Received: from vern.gendns.com ([98.142.107.122]:53368 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADU50 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 15:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YmobwPTiuWw7JVPvr86bpoyIsLhY9YTw7XWLa259YL8=; b=k2VCTl1drOidf4pMHedSUiS1oQ
        72XmA1QzurPSs+Ix0MHirIlpRxl5MpjYPuquIGGTggzQpcyhq9UbBjEd39T84raLBuC3TgmHXXh2h
        KTqgPb/p3a3+6/S7ncblW4bkPRWuQiTUBL1nhgIdgpCoeDu44mIxBd1ceH+LhDeu8fxs8CSnFZHs/
        C8CyFvdU2JgAwdspiv3CYD70L7aUISqW0hFOJhTuYFZ6Q74YvQm6epxBcC/kyw3e/MEnwCd66Wwre
        U47QTogDkmKjvOs/OS6fEFInK543H8CtOgkMHfY8373K2+U/0mr84I2XgPZyAWRacaKgERIeio/Tb
        NDTyRtJQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:55412 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kwWuB-0007Oy-6u; Mon, 04 Jan 2021 15:56:43 -0500
From:   David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 2/5] remoteproc: pru: Add APIs to get and put the PRU
 cores
To:     grzegorz.jaszczyk@linaro.org
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, praneeth@ti.com, robh+dt@kernel.org,
        rogerq@ti.com, s-anna@ti.com, ssantosh@kernel.org, t-kristo@ti.com
References: <20201216165239.2744-3-grzegorz.jaszczyk@linaro.org>
Message-ID: <4d3048fd-76be-e07d-b155-95a9600053eb@lechnology.com>
Date:   Mon, 4 Jan 2021 14:56:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216165239.2744-3-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


> 
> @@ -706,14 +824,14 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
>  	case RTU0_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case PRU0_IRAM_ADDR_MASK:
> -		pru->id = 0;
> +		pru->id = PRUSS_PRU0;
>  		break;
>  	case TX_PRU1_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case RTU1_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case PRU1_IRAM_ADDR_MASK:
> -		pru->id = 1;
> +		pru->id = PRUSS_PRU1;
>  		break;
>  	default:
>  		ret = -EINVAL;



There is a similar opportunity for using PRUSS_PRU1 in pru_d_da_to_va()
