Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD65510128C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 Nov 2019 05:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfKSEjQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 18 Nov 2019 23:39:16 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:41610 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKSEjQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 23:39:16 -0500
Received: by mail-pj1-f65.google.com with SMTP id gc1so2185973pjb.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Nov 2019 20:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Q2xgiO0SCUHCJ01fPdKFNn4jj9dQWkJKPBYAQQCb+M=;
        b=RaG20AKfRfRSNJs29D/cPmOTrEFYL4nPFHgmG5xo24MqBUzPA9NQEETVpH2uFb7Zrs
         OJOYq5t88Af765f3ykzYuaFi1qoYb68ULdaVnvAnmJShKgtwU/zLRNuFRaIuLJykgIRp
         YnzQaZLR17rSR9Aevo+/S+inPEJGDvxiyhlIsrlys7lMUWdBgraaOgjEDCwYnFMF8UGV
         INxfmosBpUAYqmKnb9zYkLLGa1NdIoy1g3EaVL7KWIMiUnAMM5D+OfMeG5PUdkW9DihT
         TsphKiY0fY3NdbTAsKjwwi9dhPriE7wXeLEcYv4nqqaM/qCdAk/xxLEhBsE35Tq5PTLL
         VsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Q2xgiO0SCUHCJ01fPdKFNn4jj9dQWkJKPBYAQQCb+M=;
        b=hT0KoT5vEnTN6Wp5vYObSE88lzWxfXeSAL3mFGotIeIJ51ARj1cN5KmzG6qEc+f1/O
         NnBsKxr6DrAjWZnAWLxd9zoPGM+9gdJIgV8eCIljX856sQArvPSZIEefjzZPCpMUdb++
         cKlfmO/X57JUdzMGdr1ytF56sWThHVIVWuXIuzz/B7g4ecL/qL95n/qlYADLP+m40DqB
         zjXMgOBrdf1AuhjYulpoDaqzlDArwc00tiyVjK7S4fuHNuS8WT60fw0tGesXyWbsNWaq
         xEXQo6sqzB1+f1IHRlxCMdyg0WVS1AhH8to2Xrr5G9k4U+qMxfWPz2vqgGI0pvS3Pt4B
         HpTA==
X-Gm-Message-State: APjAAAUpNo/whnMSJMoQoaodKIBmkgPW9nBgPHe7x7AJHqKvtlGOq3BV
        3kV7rN9P8azgM0gkyv3GdozqCw==
X-Google-Smtp-Source: APXvYqzzV3JKKbYmesiphq/qNjx6W36HWDkmcjzcLqVtGtVM9zWe3dc/jdPtzPqDq4dUmntOc38riQ==
X-Received: by 2002:a17:902:ff14:: with SMTP id f20mr32149430plj.225.1574138355290;
        Mon, 18 Nov 2019 20:39:15 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j7sm20638171pgl.38.2019.11.18.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 20:39:14 -0800 (PST)
Date:   Mon, 18 Nov 2019 20:39:12 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v4] remoteproc: stm32: fix probe error case
Message-ID: <20191119043912.GT3108315@builder>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 15 Nov 02:03 PST 2019, Fabien Dessenne wrote:
> +
> +	return 0;
> +
> +err_probe:
> +	for (j = i - 1; j >= 0; j--)

It's idiomatic to just use 'i' itself here. But I applied this as is,
with Mathieu's t-b.

Thanks,
Bjorn
