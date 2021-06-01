Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C9A396308
	for <lists+linux-remoteproc@lfdr.de>; Mon, 31 May 2021 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhEaPDb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 31 May 2021 11:03:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234271AbhEaPBa (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 11:01:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9766C613B4;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622472647;
        bh=U1U4Cbu5nar5vEt55QSaFfLT46zQDYD4Y0liH4al7U4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jI0R2IUtXmvzAxa0vkNgBQ8TxjgCqu48p+MGHS/M/tIuGOh9QwizxVZ+ySbjY0RBW
         Wr6q5F8BUwYRU+W9B6kSh84fVVN8DNRzGRAq7OLaJSb2taJp/qVlyHea3/XBtuCU/z
         0iWGCldi1M0FYZrNBMBz1oQfsvD2zFahPSVpl7ybdKFJLBpWzi9Yb9gFLpeGce8U6p
         FbIuSvqH1yJ8D7axucKRNO57o9X2jySqCGTyQx7/7/nsPjJir4UVLwGBifayRemBaE
         XXEzX+dgVILTsVV1i6tvy7KDgBBgTQ0F6buooQ8jlOGvCIFwR8OwrBEOKuE4yoVmZT
         hte4LEnmafrVQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8F64E60CD6;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: pas: Convert binding to YAML
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162247264758.13780.13136765386048454509.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 14:50:47 +0000
References: <20210505082200.32635-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210505082200.32635-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed,  5 May 2021 13:52:00 +0530 you wrote:
> Convert Qualcomm ADSP Remoteproc devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,adsp.txt         | 228 --------
>  .../bindings/remoteproc/qcom,adsp.yaml        | 534 ++++++++++++++++++
>  2 files changed, 534 insertions(+), 228 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml

Here is the summary with links:
  - dt-bindings: remoteproc: qcom: pas: Convert binding to YAML
    https://git.kernel.org/andersson/remoteproc/c/cf107e98d024

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


