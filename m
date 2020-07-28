Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0A7230326
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Jul 2020 08:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgG1GkD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 28 Jul 2020 02:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726873AbgG1GkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 02:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595918403;
        bh=e5Qnj0+sTv4opquOZVNpL+WxD+QvVXEgiLG4Xa3Lm9g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OENJw0UkXk0WjRrM/sMrb8gLbtLpVo8skcy8lzUII4Au/UOyuuo5UT5yAK0gj5dpH
         pOubgMW3bdKxODoVZ8QGBRy1+kuDwPmKYqXWqG2KQH+S3EyTD3QsVL/dPcr+OmBVV+
         8m6Yn6sWJa7HSUQZU75I67Ycin9zBUdJW4uQ1AgI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] Add modem debug features
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159591840310.2302.3809712609952615210.git-patchwork-notify@kernel.org>
Date:   Tue, 28 Jul 2020 06:40:03 +0000
References: <20200722201047.12975-1-sibis@codeaurora.org>
In-Reply-To: <20200722201047.12975-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 23 Jul 2020 01:40:44 +0530 you wrote:
> The series adds support for the following modem debug features:
>  * Modem debug policy which enables coredumps/live debug on secure devices
>  * MBA text logs extraction on SC7180 SoCs
> 
> The series also includes fixes for a couple of mem aborts seen when
> mba/modem blob size exceeds mba/mpss regions respectively.
> 
> [...]


Here is a summary with links:
  - [v3,1/3] remoteproc: qcom_q6v5_mss: Validate MBA firmware size before load
    https://git.kernel.org/andersson/remoteproc/c/e013f455d95add874f310dc47c608e8c70692ae5
  - [v3,2/3] remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load
    https://git.kernel.org/andersson/remoteproc/c/135b9e8d1cd8ba5ac9ad9bcf24b464b7b052e5b8
  - [v3,3/3] remoteproc: qcom_q6v5_mss: Add modem debug policy support
    https://git.kernel.org/andersson/remoteproc/c/fe6a5dc4b03171653d217e6dc7c1739e90c660bb

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
