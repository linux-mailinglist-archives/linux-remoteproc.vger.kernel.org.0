Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4098C1448CA
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jan 2020 01:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAVAPl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jan 2020 19:15:41 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37227 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAVAPl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 19:15:41 -0500
Received: by mail-pl1-f194.google.com with SMTP id c23so2089637plz.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 16:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uMbywrTPsxfZSBXVaeh9dbhFR/uHepQtgZ85VleXQo0=;
        b=ZlkxXO3YTsp0gXrCApq7if59NCipDlveOu08UgxWT5PAJ0F7fy3rSxpfO4W7MBc/c6
         nVSRAK9n6casmvdO7elcwHXFpbGfaowbz4+iG04ZSYD1/5qye0nYiMgrcsp/Cw5kI3iE
         gOvDr/DzQzChvSEoXzeYRWXrLvqcukW6cC14Vd+lG2BWcwUkn6WsMoJaLsSMNpIC09ZR
         +SgYg7htOfltMxBZRuxzbKlQ6JyaKjb7hXgubI7lLwaGho7tRGZiInNyyzMVJvEwk8dR
         hGLts+hSoZ71+TPbTPHj6imdQWaB1ohXH3yU0mNeAFt+JEdFn4KThs+JENPG3pd2ikXb
         gFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uMbywrTPsxfZSBXVaeh9dbhFR/uHepQtgZ85VleXQo0=;
        b=XfJD4bbpyN/UdW2TWsK+bzmFRZvkJyMM1YDuarGAB40Baj8zv/U/7Ocdxaf57uFhHJ
         1YrQxsPoylXbbSNkwxOALIgrpgrXvVRu1dElAPLRRSe3m9ZSTgeO5E8342JQBjp76LKW
         FpFDP836CiGvJaNs57uxvMzS3xi3XHD1pq+BbMFR/hwTEP09xTthPI8C8hmSq7Etplyn
         4HlP98VB8RszhJeWSe9J4B5pAPjESqofnMV/5ZNCQ9SgYg5NqILgPxuOy53Cn5XhVeTn
         0LP01iUIIld5MNMOf6A1Tp75+aQfkiGl83kJAj5zHm98xgssnDvGUCfqwpLYxCvqO88G
         xSmQ==
X-Gm-Message-State: APjAAAX/gkAfsJsozrdQgE5wdFrpQ3RMVEfsqxOxPUfUkTXKyvddL93a
        5SW9o4zkv2Ppn8a3CWErItGvww==
X-Google-Smtp-Source: APXvYqzeCp2WifWTXu7a0ig3fTBpZ7nkuy9/Crv3m/WydSkW3Gf74TrM6cSoqH7AolIuw/pbZo+GXg==
X-Received: by 2002:a17:902:9009:: with SMTP id a9mr8018482plp.124.1579652140638;
        Tue, 21 Jan 2020 16:15:40 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z26sm46052109pfa.90.2020.01.21.16.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 16:15:40 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:15:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] Some improvements for Qualcomm hwspinlock
Message-ID: <20200122001538.GB14744@builder>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 07 Jan 19:09 PST 2020, Baolin Wang wrote:

> This patch set did some optimization for Qualcomm hwlock controller,
> including using devm_hwspin_lock_register() API to simplify code and
> removing redundant pm runtime functions.
> 

Applied, thanks!

> Baolin Wang (2):
>   hwspinlock: qcom: Remove redundant PM runtime functions
>   hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
>  drivers/hwspinlock/qcom_hwspinlock.c |   28 ++--------------------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> -- 
> 1.7.9.5
> 
